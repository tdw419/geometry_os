; DESCRIPTION: Places a magenta line segment connecting (354, 176) to (472, 87).
; PLAN: r0=354(x1), r1=176(y1), r2=472(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 176
LDI r2, 472
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
