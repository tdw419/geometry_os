; DESCRIPTION: Composite: Draws a blue circle centered at (52, 69) with radius 23 then Draws a white rectangle at (196, 94) with width 98 and height 83 then Places a black dot at position (281, 157).
; PLAN: r0=52(x), r1=69(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x), r6=94(y), r7=98(width), r8=83(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x), r11=157(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 52
LDI r1, 69
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 94
LDI r7, 98
LDI r8, 83
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 157
LDI r12, 0x000000
PSET r10, r11, r12
HALT
