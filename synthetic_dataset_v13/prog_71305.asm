; DESCRIPTION: Composite: Renders a blue disk with center (161, 18) and radius 13 then Draws a black rectangle at (344, 84) with width 17 and height 102.
; PLAN: r0=161(x), r1=18(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x), r6=84(y), r7=17(width), r8=102(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 18
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 84
LDI r7, 17
LDI r8, 102
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
