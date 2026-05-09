; DESCRIPTION: Renders a yellow line between points (40, 167) and (35, 9).
; PLAN: r0=40(x1), r1=167(y1), r2=35(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 167
LDI r2, 35
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
