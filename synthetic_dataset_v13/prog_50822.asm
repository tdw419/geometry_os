; DESCRIPTION: Composite: Sets a single orange pixel at (410, 57) then Draws a black circle centered at (461, 95) with radius 44.
; PLAN: r0=410(x), r1=57(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=461(x), r6=95(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 410
LDI r1, 57
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 461
LDI r6, 95
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
