; DESCRIPTION: Composite: Draws a white rectangle at (366, 33) with width 108 and height 105 then Places a red line segment connecting (250, 132) to (304, 213) then Renders a blue disk with center (303, 148) and radius 78.
; PLAN: r0=366(x), r1=33(y), r2=108(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x1), r6=132(y1), r7=304(x2), r8=213(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=148(y), r12=78(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 366
LDI r1, 33
LDI r2, 108
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 132
LDI r7, 304
LDI r8, 213
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 148
LDI r12, 78
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
