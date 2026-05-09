; DESCRIPTION: Composite: Draws a orange circle centered at (291, 169) with radius 60 then Places a white dot at position (447, 102).
; PLAN: r0=291(x), r1=169(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x), r6=102(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 291
LDI r1, 169
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 102
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
