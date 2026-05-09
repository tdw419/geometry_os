; DESCRIPTION: Composite: Draws a blue rectangle at (393, 24) with width 35 and height 37 then Places a purple dot at position (430, 119).
; PLAN: r0=393(x), r1=24(y), r2=35(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=119(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 393
LDI r1, 24
LDI r2, 35
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 119
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
