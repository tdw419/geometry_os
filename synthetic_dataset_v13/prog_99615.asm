; DESCRIPTION: Composite: Sets a single green pixel at (166, 118) then Places a white line segment connecting (291, 134) to (212, 183).
; PLAN: r0=166(x), r1=118(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=291(x1), r6=134(y1), r7=212(x2), r8=183(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 118
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 291
LDI r6, 134
LDI r7, 212
LDI r8, 183
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
