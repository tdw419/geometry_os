; DESCRIPTION: Draws a purple circle centered at (255, 241) with radius 12.
; PLAN: r0=255(x), r1=241(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 241
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
