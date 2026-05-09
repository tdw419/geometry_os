; DESCRIPTION: Places a magenta line segment connecting (476, 203) to (26, 90).
; PLAN: r0=476(x1), r1=203(y1), r2=26(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 203
LDI r2, 26
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
