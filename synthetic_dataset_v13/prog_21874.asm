; DESCRIPTION: Renders a purple line between points (165, 224) and (36, 139).
; PLAN: r0=165(x1), r1=224(y1), r2=36(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 224
LDI r2, 36
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
