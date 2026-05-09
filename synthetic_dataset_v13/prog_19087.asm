; DESCRIPTION: Composite: Places a red circle of radius 64 at center (372, 92) then Places a red dot at position (229, 41).
; PLAN: r0=372(x), r1=92(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=41(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 92
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 41
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
