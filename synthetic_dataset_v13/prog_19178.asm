; DESCRIPTION: Composite: Sets a single black pixel at (37, 31) then Places a orange circle of radius 37 at center (284, 102).
; PLAN: r0=37(x), r1=31(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=102(y), r7=37(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 37
LDI r1, 31
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 284
LDI r6, 102
LDI r7, 37
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
