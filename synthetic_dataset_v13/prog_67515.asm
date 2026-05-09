; DESCRIPTION: Composite: Renders a orange line between points (495, 75) and (297, 159) then Places a red dot at position (17, 125).
; PLAN: r0=495(x1), r1=75(y1), r2=297(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=125(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 495
LDI r1, 75
LDI r2, 297
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 125
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
