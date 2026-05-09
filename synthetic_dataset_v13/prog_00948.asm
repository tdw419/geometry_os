; DESCRIPTION: Composite: Draws a magenta circle centered at (333, 157) with radius 62 then Draws a purple rectangle at (69, 125) with width 108 and height 95 then Places a orange dot at position (64, 152).
; PLAN: r0=333(x), r1=157(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=125(y), r7=108(width), r8=95(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=64(x), r11=152(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 333
LDI r1, 157
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 125
LDI r7, 108
LDI r8, 95
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 152
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
