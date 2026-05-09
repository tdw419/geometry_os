; DESCRIPTION: Composite: Draws a yellow rectangle at (261, 88) with width 119 and height 105 then Places a blue dot at position (66, 18).
; PLAN: r0=261(x), r1=88(y), r2=119(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=18(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 261
LDI r1, 88
LDI r2, 119
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 18
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
