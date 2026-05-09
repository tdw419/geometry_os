; DESCRIPTION: Composite: Creates a magenta circular shape at (245, 174) with radius 15 then Places a red dot at position (110, 54) then Draws a green rectangle at (390, 14) with width 99 and height 41.
; PLAN: r0=245(x), r1=174(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=110(x), r6=54(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=390(x), r11=14(y), r12=99(width), r13=41(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 174
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 110
LDI r6, 54
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 390
LDI r11, 14
LDI r12, 99
LDI r13, 41
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
