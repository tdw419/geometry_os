; DESCRIPTION: Renders a black line between points (301, 92) and (507, 2).
; PLAN: r0=301(x1), r1=92(y1), r2=507(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 92
LDI r2, 507
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
