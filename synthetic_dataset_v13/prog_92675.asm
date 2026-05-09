; DESCRIPTION: Composite: Sets a single orange pixel at (55, 149) then Places a yellow line segment connecting (85, 97) to (20, 183).
; PLAN: r0=55(x), r1=149(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=85(x1), r6=97(y1), r7=20(x2), r8=183(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 149
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 85
LDI r6, 97
LDI r7, 20
LDI r8, 183
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
