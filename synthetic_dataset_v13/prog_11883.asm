; DESCRIPTION: Composite: Draws a purple circle centered at (105, 60) with radius 60 then Draws a green rectangle at (292, 170) with width 103 and height 64 then Places a blue dot at position (310, 106).
; PLAN: r0=105(x), r1=60(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=170(y), r7=103(width), r8=64(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=310(x), r11=106(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 60
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 170
LDI r7, 103
LDI r8, 64
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 106
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
