; DESCRIPTION: Draws a magenta circle centered at (441, 208) with radius 42.
; PLAN: r0=441(x), r1=208(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 208
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
