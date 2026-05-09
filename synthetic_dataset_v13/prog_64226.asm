; DESCRIPTION: Places a magenta line segment connecting (224, 11) to (311, 179).
; PLAN: r0=224(x1), r1=11(y1), r2=311(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 11
LDI r2, 311
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
