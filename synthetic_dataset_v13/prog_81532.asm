; DESCRIPTION: Composite: Places a orange dot at position (173, 38) then Draws a magenta circle centered at (267, 142) with radius 39.
; PLAN: r0=173(x), r1=38(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=267(x), r6=142(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 38
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 267
LDI r6, 142
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
