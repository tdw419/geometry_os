; DESCRIPTION: Composite: Sets a single yellow pixel at (6, 146) then Places a orange circle of radius 22 at center (378, 33).
; PLAN: r0=6(x), r1=146(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=33(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 146
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 378
LDI r6, 33
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
