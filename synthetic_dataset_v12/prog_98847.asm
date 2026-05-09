; DESCRIPTION: Renders a black line between points (314, 22) and (118, 154).
; PLAN: r0=314(x1), r1=22(y1), r2=118(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 22
LDI r2, 118
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
