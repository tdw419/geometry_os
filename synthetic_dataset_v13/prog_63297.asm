; DESCRIPTION: Places a magenta line segment connecting (224, 199) to (477, 120).
; PLAN: r0=224(x1), r1=199(y1), r2=477(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 199
LDI r2, 477
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
