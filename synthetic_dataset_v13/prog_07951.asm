; DESCRIPTION: Renders a magenta line between points (472, 66) and (407, 114).
; PLAN: r0=472(x1), r1=66(y1), r2=407(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 66
LDI r2, 407
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
