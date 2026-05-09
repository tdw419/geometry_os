; DESCRIPTION: Composite: Places a red circle of radius 20 at center (475, 232) then Places a red dot at position (166, 47).
; PLAN: r0=475(x), r1=232(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=47(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 475
LDI r1, 232
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 47
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
