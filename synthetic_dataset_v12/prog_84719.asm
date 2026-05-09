; DESCRIPTION: Draws a purple circle centered at (32, 104) with radius 24.
; PLAN: r0=32(x), r1=104(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 104
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
