; DESCRIPTION: Composite: Sets a single black pixel at (182, 9) then Draws a orange circle centered at (268, 210) with radius 29.
; PLAN: r0=182(x), r1=9(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=210(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 182
LDI r1, 9
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 268
LDI r6, 210
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
