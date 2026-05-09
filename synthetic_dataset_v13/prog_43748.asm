; DESCRIPTION: Places a magenta line segment connecting (258, 249) to (84, 205).
; PLAN: r0=258(x1), r1=249(y1), r2=84(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 249
LDI r2, 84
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
