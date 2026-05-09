; DESCRIPTION: Renders a black line between points (5, 184) and (149, 216).
; PLAN: r0=5(x1), r1=184(y1), r2=149(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 184
LDI r2, 149
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
