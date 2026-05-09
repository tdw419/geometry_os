; DESCRIPTION: Composite: Draws a red rectangle at (199, 9) with width 74 and height 44 then Places a purple dot at position (110, 45).
; PLAN: r0=199(x), r1=9(y), r2=74(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=110(x), r6=45(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 199
LDI r1, 9
LDI r2, 74
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 45
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
