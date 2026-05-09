; DESCRIPTION: Places a magenta line segment connecting (337, 211) to (15, 101).
; PLAN: r0=337(x1), r1=211(y1), r2=15(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 211
LDI r2, 15
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
