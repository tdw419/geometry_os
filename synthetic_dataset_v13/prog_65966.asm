; DESCRIPTION: Draws a purple line from (509, 224) to (4, 201).
; PLAN: r0=509(x1), r1=224(y1), r2=4(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 224
LDI r2, 4
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
