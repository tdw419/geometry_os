; DESCRIPTION: Renders a purple line between points (256, 224) and (122, 184).
; PLAN: r0=256(x1), r1=224(y1), r2=122(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 224
LDI r2, 122
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
