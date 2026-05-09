; DESCRIPTION: Composite: Places a orange dot at position (499, 250) then Draws a magenta circle centered at (289, 232) with radius 19.
; PLAN: r0=499(x), r1=250(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=232(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 499
LDI r1, 250
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 289
LDI r6, 232
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
