; DESCRIPTION: Draws a magenta circle centered at (346, 103) with radius 62.
; PLAN: r0=346(x), r1=103(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 103
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
