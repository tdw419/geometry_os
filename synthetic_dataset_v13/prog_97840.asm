; DESCRIPTION: Renders a black line between points (149, 77) and (379, 55).
; PLAN: r0=149(x1), r1=77(y1), r2=379(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 77
LDI r2, 379
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
