; DESCRIPTION: Composite: Sets a single red pixel at (114, 245) then Draws a cyan circle centered at (287, 87) with radius 43.
; PLAN: r0=114(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=87(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 245
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 287
LDI r6, 87
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
