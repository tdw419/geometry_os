; DESCRIPTION: Draws a magenta circle centered at (126, 134) with radius 42.
; PLAN: r0=126(x), r1=134(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 134
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
