; DESCRIPTION: Composite: Places a orange dot at position (272, 200) then Places a purple line segment connecting (14, 51) to (268, 115).
; PLAN: r0=272(x), r1=200(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=14(x1), r6=51(y1), r7=268(x2), r8=115(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 200
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 14
LDI r6, 51
LDI r7, 268
LDI r8, 115
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
