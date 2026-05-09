; DESCRIPTION: Draws a blue circle centered at (74, 32) with radius 31.
; PLAN: r0=74(x), r1=32(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 32
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
