; DESCRIPTION: Composite: Draws a blue rectangle at (191, 99) with width 78 and height 119 then Places a yellow dot at position (128, 41) then Draws a cyan circle centered at (199, 160) with radius 49.
; PLAN: r0=191(x), r1=99(y), r2=78(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x), r6=41(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=199(x), r11=160(y), r12=49(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 191
LDI r1, 99
LDI r2, 78
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 41
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 199
LDI r11, 160
LDI r12, 49
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
