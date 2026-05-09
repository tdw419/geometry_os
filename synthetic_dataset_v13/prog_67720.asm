; DESCRIPTION: Composite: Draws a green rectangle at (362, 162) with width 33 and height 11 then Creates a orange circular shape at (69, 159) with radius 62.
; PLAN: r0=362(x), r1=162(y), r2=33(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=159(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 362
LDI r1, 162
LDI r2, 33
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 159
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
