; DESCRIPTION: Composite: Draws a green rectangle at (110, 2) with width 88 and height 82 then Places a purple dot at position (17, 18) then Draws a orange circle centered at (429, 165) with radius 26.
; PLAN: r0=110(x), r1=2(y), r2=88(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=18(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=429(x), r11=165(y), r12=26(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 110
LDI r1, 2
LDI r2, 88
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 18
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 429
LDI r11, 165
LDI r12, 26
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
