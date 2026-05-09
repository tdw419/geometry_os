; DESCRIPTION: Composite: Draws a magenta rectangle at (137, 55) with width 62 and height 23 then Places a orange dot at position (483, 60) then Draws a orange circle centered at (333, 174) with radius 64.
; PLAN: r0=137(x), r1=55(y), r2=62(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x), r6=60(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=333(x), r11=174(y), r12=64(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 137
LDI r1, 55
LDI r2, 62
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 60
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 333
LDI r11, 174
LDI r12, 64
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
