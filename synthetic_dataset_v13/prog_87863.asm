; DESCRIPTION: Composite: Draws a green rectangle at (54, 12) with width 119 and height 114 then Places a purple dot at position (254, 153).
; PLAN: r0=54(x), r1=12(y), r2=119(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=153(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 54
LDI r1, 12
LDI r2, 119
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 153
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
