; DESCRIPTION: Places a magenta line segment connecting (80, 158) to (253, 199).
; PLAN: r0=80(x1), r1=158(y1), r2=253(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 158
LDI r2, 253
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
