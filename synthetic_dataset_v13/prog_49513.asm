; DESCRIPTION: Draws a magenta circle centered at (400, 128) with radius 42.
; PLAN: r0=400(x), r1=128(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 128
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
