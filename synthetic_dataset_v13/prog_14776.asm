; DESCRIPTION: Composite: Creates a orange circular shape at (345, 174) with radius 46 then Draws a black rectangle at (491, 158) with width 10 and height 12 then Places a magenta dot at position (44, 40).
; PLAN: r0=345(x), r1=174(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x), r6=158(y), r7=10(width), r8=12(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=44(x), r11=40(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 345
LDI r1, 174
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 158
LDI r7, 10
LDI r8, 12
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 44
LDI r11, 40
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
