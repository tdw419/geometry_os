; DESCRIPTION: Places a magenta line segment connecting (265, 49) to (510, 224).
; PLAN: r0=265(x1), r1=49(y1), r2=510(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 49
LDI r2, 510
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
