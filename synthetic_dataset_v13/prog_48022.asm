; DESCRIPTION: Composite: Draws a green circle centered at (62, 26) with radius 25 then Draws a blue rectangle at (99, 66) with width 95 and height 111 then Places a green dot at position (348, 41).
; PLAN: r0=62(x), r1=26(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x), r6=66(y), r7=95(width), r8=111(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=348(x), r11=41(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 62
LDI r1, 26
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 66
LDI r7, 95
LDI r8, 111
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 41
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
