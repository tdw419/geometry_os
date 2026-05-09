; DESCRIPTION: Composite: Draws a white rectangle at (311, 39) with width 102 and height 59 then Draws a black line from (37, 135) to (258, 178) then Renders a white disk with center (157, 159) and radius 18.
; PLAN: r0=311(x), r1=39(y), r2=102(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x1), r6=135(y1), r7=258(x2), r8=178(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=159(y), r12=18(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 311
LDI r1, 39
LDI r2, 102
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 135
LDI r7, 258
LDI r8, 178
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 159
LDI r12, 18
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
