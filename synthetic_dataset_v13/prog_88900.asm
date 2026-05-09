; DESCRIPTION: Draws a magenta circle centered at (416, 215) with radius 14.
; PLAN: r0=416(x), r1=215(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 215
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
