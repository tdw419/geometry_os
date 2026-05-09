; DESCRIPTION: Composite: Draws a black rectangle at (156, 77) with width 37 and height 105 then Places a blue dot at position (17, 203).
; PLAN: r0=156(x), r1=77(y), r2=37(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=203(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 156
LDI r1, 77
LDI r2, 37
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 203
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
