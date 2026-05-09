; DESCRIPTION: Composite: Places a red circle of radius 41 at center (204, 197) then Draws a black rectangle at (45, 78) with width 116 and height 88 then Draws a yellow line from (90, 204) to (83, 118).
; PLAN: r0=204(x), r1=197(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=78(y), r7=116(width), r8=88(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=90(x1), r11=204(y1), r12=83(x2), r13=118(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 197
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 78
LDI r7, 116
LDI r8, 88
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 204
LDI r12, 83
LDI r13, 118
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
