function [Tcpd,lambda,gen]=mycpd_TL(T1,n)
Tcpd = cpd(T1,n);
gen = cpdgen(Tcpd);

lambda=ones(1,n);
leg=cell(1,n);
for i=1:n
    s = 1;
    for j=1:length(size(T1))
        c = Tcpd{j};
        ci = c(:,i);
        l = norm(ci)./sqrt(length(ci));
        if mean(ci)<0
            l = -l;
        end
        ci = ci./l;
        c(:,i) = ci;
        Tcpd{j} = c;
        s = s.*l;
    end
    lambda(i) = s;
end
