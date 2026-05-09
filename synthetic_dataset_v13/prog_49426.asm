; DESCRIPTION: Places a magenta line segment connecting (224, 2) to (489, 71).
; PLAN: r0=224(x1), r1=2(y1), r2=489(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 2
LDI r2, 489
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
