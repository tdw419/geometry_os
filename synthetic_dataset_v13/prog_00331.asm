; DESCRIPTION: Composite: Draws a orange rectangle at (272, 74) with width 75 and height 56 then Places a purple dot at position (172, 30).
; PLAN: r0=272(x), r1=74(y), r2=75(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=30(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 74
LDI r2, 75
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 30
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
