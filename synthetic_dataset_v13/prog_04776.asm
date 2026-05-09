; DESCRIPTION: Renders a magenta line between points (97, 88) and (476, 112).
; PLAN: r0=97(x1), r1=88(y1), r2=476(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 88
LDI r2, 476
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
