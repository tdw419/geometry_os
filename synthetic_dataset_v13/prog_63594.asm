; DESCRIPTION: Composite: Sets a single black pixel at (402, 103) then Draws a orange circle centered at (373, 114) with radius 65.
; PLAN: r0=402(x), r1=103(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=114(y), r7=65(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 103
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 373
LDI r6, 114
LDI r7, 65
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
