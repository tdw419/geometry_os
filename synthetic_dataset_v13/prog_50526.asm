; DESCRIPTION: Places a purple line segment connecting (224, 166) to (361, 69).
; PLAN: r0=224(x1), r1=166(y1), r2=361(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 166
LDI r2, 361
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
