; DESCRIPTION: Composite: Draws a red circle centered at (430, 200) with radius 12 then Places a red dot at position (290, 36).
; PLAN: r0=430(x), r1=200(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=290(x), r6=36(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 430
LDI r1, 200
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 290
LDI r6, 36
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
