; DESCRIPTION: Draws a blue circle centered at (373, 64) with radius 56.
; PLAN: r0=373(x), r1=64(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 64
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
