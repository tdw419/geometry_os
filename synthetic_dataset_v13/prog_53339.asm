; DESCRIPTION: Composite: Draws a green rectangle at (53, 86) with width 83 and height 70 then Places a blue dot at position (144, 2).
; PLAN: r0=53(x), r1=86(y), r2=83(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=2(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 53
LDI r1, 86
LDI r2, 83
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 2
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
