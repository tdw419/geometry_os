; DESCRIPTION: Composite: Creates a orange circular shape at (37, 198) with radius 26 then Draws a blue rectangle at (258, 181) with width 43 and height 33.
; PLAN: r0=37(x), r1=198(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x), r6=181(y), r7=43(width), r8=33(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 198
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 181
LDI r7, 43
LDI r8, 33
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
