; DESCRIPTION: Places a magenta line segment connecting (224, 224) to (251, 33).
; PLAN: r0=224(x1), r1=224(y1), r2=251(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 224
LDI r2, 251
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
