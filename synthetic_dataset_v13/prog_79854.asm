; DESCRIPTION: Places a magenta line segment connecting (194, 142) to (232, 178).
; PLAN: r0=194(x1), r1=142(y1), r2=232(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 142
LDI r2, 232
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
