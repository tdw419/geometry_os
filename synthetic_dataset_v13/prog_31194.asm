; DESCRIPTION: Renders a black line between points (5, 218) and (149, 62).
; PLAN: r0=5(x1), r1=218(y1), r2=149(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 218
LDI r2, 149
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
