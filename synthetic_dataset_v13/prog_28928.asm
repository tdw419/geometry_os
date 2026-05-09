; DESCRIPTION: Renders a black line between points (2, 80) and (507, 181).
; PLAN: r0=2(x1), r1=80(y1), r2=507(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 80
LDI r2, 507
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
