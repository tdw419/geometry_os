; DESCRIPTION: Draws a blue circle centered at (405, 151) with radius 73.
; PLAN: r0=405(x), r1=151(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 151
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
