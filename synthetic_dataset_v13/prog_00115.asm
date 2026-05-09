; DESCRIPTION: Composite: Draws a blue rectangle at (332, 8) with width 41 and height 37 then Draws a blue circle centered at (205, 171) with radius 38 then Places a green dot at position (483, 107).
; PLAN: r0=332(x), r1=8(y), r2=41(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x), r6=171(y), r7=38(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=483(x), r11=107(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 332
LDI r1, 8
LDI r2, 41
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 171
LDI r7, 38
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 483
LDI r11, 107
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
