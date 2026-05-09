; DESCRIPTION: Composite: Sets a single black pixel at (399, 42) then Draws a purple circle centered at (180, 170) with radius 63.
; PLAN: r0=399(x), r1=42(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=170(y), r7=63(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 399
LDI r1, 42
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 180
LDI r6, 170
LDI r7, 63
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
