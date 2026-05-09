; DESCRIPTION: Composite: Sets a single red pixel at (490, 41) then Places a white circle of radius 37 at center (287, 41).
; PLAN: r0=490(x), r1=41(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=41(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 490
LDI r1, 41
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 287
LDI r6, 41
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
