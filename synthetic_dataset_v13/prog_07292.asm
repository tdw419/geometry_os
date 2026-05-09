; DESCRIPTION: Draws a magenta circle centered at (439, 144) with radius 60.
; PLAN: r0=439(x), r1=144(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 144
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
