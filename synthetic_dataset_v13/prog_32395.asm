; DESCRIPTION: Renders a magenta line between points (496, 175) and (390, 25).
; PLAN: r0=496(x1), r1=175(y1), r2=390(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 175
LDI r2, 390
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
