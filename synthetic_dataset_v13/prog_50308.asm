; DESCRIPTION: Composite: Sets a single green pixel at (294, 199) then Draws a orange line from (159, 130) to (370, 35).
; PLAN: r0=294(x), r1=199(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=159(x1), r6=130(y1), r7=370(x2), r8=35(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 199
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 159
LDI r6, 130
LDI r7, 370
LDI r8, 35
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
