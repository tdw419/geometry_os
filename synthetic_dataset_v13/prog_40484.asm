; DESCRIPTION: Draws a blue circle centered at (136, 159) with radius 42.
; PLAN: r0=136(x), r1=159(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 159
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
