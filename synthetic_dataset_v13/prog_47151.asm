; DESCRIPTION: Composite: Draws a green rectangle at (154, 128) with width 54 and height 66 then Draws a blue circle centered at (291, 114) with radius 65 then Places a orange dot at position (380, 8).
; PLAN: r0=154(x), r1=128(y), r2=54(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=114(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=8(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 128
LDI r2, 54
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 114
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 8
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
