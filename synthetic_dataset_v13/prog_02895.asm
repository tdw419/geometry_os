; DESCRIPTION: Renders a yellow line between points (78, 167) and (264, 175).
; PLAN: r0=78(x1), r1=167(y1), r2=264(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 167
LDI r2, 264
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
