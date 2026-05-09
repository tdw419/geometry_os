; DESCRIPTION: Draws a magenta circle centered at (364, 173) with radius 15.
; PLAN: r0=364(x), r1=173(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 173
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
