; DESCRIPTION: Composite: Draws a orange line from (353, 76) to (111, 153) then Draws a black rectangle at (225, 187) with width 90 and height 19 then Renders a purple disk with center (52, 174) and radius 39.
; PLAN: r0=353(x1), r1=76(y1), r2=111(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=187(y), r7=90(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=52(x), r11=174(y), r12=39(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 76
LDI r2, 111
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 187
LDI r7, 90
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 174
LDI r12, 39
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
