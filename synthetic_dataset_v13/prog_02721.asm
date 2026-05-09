; DESCRIPTION: Draws a magenta circle centered at (144, 173) with radius 65.
; PLAN: r0=144(x), r1=173(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 173
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
