; DESCRIPTION: Composite: Sets a single orange pixel at (39, 251) then Renders a orange line between points (12, 165) and (354, 17).
; PLAN: r0=39(x), r1=251(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=12(x1), r6=165(y1), r7=354(x2), r8=17(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 251
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 12
LDI r6, 165
LDI r7, 354
LDI r8, 17
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
