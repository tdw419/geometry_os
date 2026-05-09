; DESCRIPTION: Renders a yellow line between points (158, 96) and (395, 2).
; PLAN: r0=158(x1), r1=96(y1), r2=395(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 96
LDI r2, 395
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
