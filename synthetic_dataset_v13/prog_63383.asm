; DESCRIPTION: Composite: Places a green line segment connecting (310, 96) to (35, 156) then Draws a yellow rectangle at (108, 69) with width 25 and height 40 then Places a white circle of radius 11 at center (462, 29).
; PLAN: r0=310(x1), r1=96(y1), r2=35(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=69(y), r7=25(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=462(x), r11=29(y), r12=11(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 310
LDI r1, 96
LDI r2, 35
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 69
LDI r7, 25
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 29
LDI r12, 11
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
