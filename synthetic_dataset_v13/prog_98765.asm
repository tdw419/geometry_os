; DESCRIPTION: Places a magenta line segment connecting (224, 134) to (436, 60).
; PLAN: r0=224(x1), r1=134(y1), r2=436(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 134
LDI r2, 436
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
