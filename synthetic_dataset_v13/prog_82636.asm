; DESCRIPTION: Composite: Draws a orange rectangle at (311, 97) with width 55 and height 56 then Renders a black disk with center (412, 65) and radius 39.
; PLAN: r0=311(x), r1=97(y), r2=55(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x), r6=65(y), r7=39(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 311
LDI r1, 97
LDI r2, 55
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 65
LDI r7, 39
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
