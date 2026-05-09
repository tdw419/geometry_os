; DESCRIPTION: Renders a black line between points (507, 238) and (314, 88).
; PLAN: r0=507(x1), r1=238(y1), r2=314(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 238
LDI r2, 314
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
