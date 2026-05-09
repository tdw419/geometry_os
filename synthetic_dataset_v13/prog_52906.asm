; DESCRIPTION: Composite: Draws a white rectangle at (37, 114) with width 119 and height 87 then Places a purple dot at position (475, 84).
; PLAN: r0=37(x), r1=114(y), r2=119(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=475(x), r6=84(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 37
LDI r1, 114
LDI r2, 119
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 84
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
