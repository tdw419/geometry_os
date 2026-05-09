; DESCRIPTION: Draws a purple circle centered at (186, 190) with radius 19.
; PLAN: r0=186(x), r1=190(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 190
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
