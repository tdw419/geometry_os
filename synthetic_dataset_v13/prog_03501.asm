; DESCRIPTION: Composite: Draws a magenta rectangle at (17, 84) with width 76 and height 96 then Places a yellow dot at position (113, 204) then Draws a blue circle centered at (263, 41) with radius 31.
; PLAN: r0=17(x), r1=84(y), r2=76(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=204(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=263(x), r11=41(y), r12=31(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 17
LDI r1, 84
LDI r2, 76
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 204
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 263
LDI r11, 41
LDI r12, 31
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
