; DESCRIPTION: Draws a magenta circle centered at (327, 139) with radius 32.
; PLAN: r0=327(x), r1=139(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 139
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
