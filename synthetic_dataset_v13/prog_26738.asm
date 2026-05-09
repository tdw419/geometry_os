; DESCRIPTION: Places a black line segment connecting (224, 101) to (163, 90).
; PLAN: r0=224(x1), r1=101(y1), r2=163(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 101
LDI r2, 163
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
