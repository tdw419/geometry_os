; DESCRIPTION: Renders a purple line between points (361, 224) and (53, 254).
; PLAN: r0=361(x1), r1=224(y1), r2=53(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 224
LDI r2, 53
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
