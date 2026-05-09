; DESCRIPTION: Renders a black line between points (356, 34) and (443, 28).
; PLAN: r0=356(x1), r1=34(y1), r2=443(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 34
LDI r2, 443
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
