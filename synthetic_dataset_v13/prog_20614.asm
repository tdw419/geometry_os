; DESCRIPTION: Draws a purple circle centered at (32, 28) with radius 10.
; PLAN: r0=32(x), r1=28(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 28
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
