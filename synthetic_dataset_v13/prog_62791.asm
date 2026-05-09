; DESCRIPTION: Renders a magenta line between points (264, 43) and (432, 78).
; PLAN: r0=264(x1), r1=43(y1), r2=432(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 43
LDI r2, 432
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
