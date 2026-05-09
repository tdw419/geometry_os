; DESCRIPTION: Places a magenta line segment connecting (354, 205) to (490, 220).
; PLAN: r0=354(x1), r1=205(y1), r2=490(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 205
LDI r2, 490
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
