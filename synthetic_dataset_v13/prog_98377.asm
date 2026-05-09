; DESCRIPTION: Places a white line segment connecting (224, 237) to (335, 100).
; PLAN: r0=224(x1), r1=237(y1), r2=335(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 237
LDI r2, 335
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
