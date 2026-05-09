; DESCRIPTION: Draws a magenta circle centered at (42, 108) with radius 29.
; PLAN: r0=42(x), r1=108(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 108
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
