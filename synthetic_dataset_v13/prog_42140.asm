; DESCRIPTION: Composite: Renders a yellow line between points (129, 48) and (422, 67) then Draws a blue rectangle at (88, 206) with width 15 and height 30 then Draws a blue circle centered at (156, 41) with radius 24.
; PLAN: r0=129(x1), r1=48(y1), r2=422(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=206(y), r7=15(width), r8=30(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=41(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 48
LDI r2, 422
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 206
LDI r7, 15
LDI r8, 30
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 41
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
