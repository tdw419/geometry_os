; DESCRIPTION: Composite: Places a blue dot at position (375, 157) then Draws a magenta circle centered at (397, 116) with radius 66.
; PLAN: r0=375(x), r1=157(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=116(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 375
LDI r1, 157
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 397
LDI r6, 116
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
