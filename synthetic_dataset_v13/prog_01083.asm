; DESCRIPTION: Renders a purple line between points (418, 224) and (134, 254).
; PLAN: r0=418(x1), r1=224(y1), r2=134(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 224
LDI r2, 134
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
