; DESCRIPTION: Draws a blue circle centered at (96, 43) with radius 42.
; PLAN: r0=96(x), r1=43(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 43
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
