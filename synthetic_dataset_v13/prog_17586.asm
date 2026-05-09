; DESCRIPTION: Composite: Draws a orange line from (375, 183) to (390, 196) then Places a cyan dot at position (17, 141).
; PLAN: r0=375(x1), r1=183(y1), r2=390(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=141(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 375
LDI r1, 183
LDI r2, 390
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 141
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
