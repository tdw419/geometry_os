; DESCRIPTION: Composite: Places a orange dot at position (429, 60) then Draws a black circle centered at (311, 123) with radius 57.
; PLAN: r0=429(x), r1=60(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=123(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 429
LDI r1, 60
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 311
LDI r6, 123
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
