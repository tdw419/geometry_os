; DESCRIPTION: Composite: Places a orange dot at position (293, 16) then Draws a magenta circle centered at (141, 141) with radius 14.
; PLAN: r0=293(x), r1=16(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=141(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 293
LDI r1, 16
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 141
LDI r6, 141
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
