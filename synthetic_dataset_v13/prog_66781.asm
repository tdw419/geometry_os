; DESCRIPTION: Composite: Places a red dot at position (41, 215) then Places a red circle of radius 72 at center (275, 111).
; PLAN: r0=41(x), r1=215(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=111(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 41
LDI r1, 215
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 275
LDI r6, 111
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
