; DESCRIPTION: Composite: Draws a orange line from (155, 147) to (70, 197) then Places a red circle of radius 36 at center (275, 137) then Draws a yellow rectangle at (235, 72) with width 10 and height 111.
; PLAN: r0=155(x1), r1=147(y1), r2=70(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=137(y), r7=36(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x), r11=72(y), r12=10(width), r13=111(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 147
LDI r2, 70
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 137
LDI r7, 36
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 72
LDI r12, 10
LDI r13, 111
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
