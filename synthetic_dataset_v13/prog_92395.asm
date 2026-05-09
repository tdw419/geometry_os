; DESCRIPTION: Composite: Draws a yellow rectangle at (213, 117) with width 68 and height 39 then Renders a blue disk with center (179, 239) and radius 13 then Renders a orange line between points (505, 117) and (159, 246).
; PLAN: r0=213(x), r1=117(y), r2=68(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=239(y), r7=13(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x1), r11=117(y1), r12=159(x2), r13=246(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 117
LDI r2, 68
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 239
LDI r7, 13
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 117
LDI r12, 159
LDI r13, 246
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
