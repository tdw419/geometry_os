; DESCRIPTION: Composite: Draws a red circle centered at (202, 183) with radius 66 then Draws a orange rectangle at (91, 200) with width 91 and height 48 then Renders a black line between points (374, 131) and (376, 125).
; PLAN: r0=202(x), r1=183(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x), r6=200(y), r7=91(width), r8=48(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x1), r11=131(y1), r12=376(x2), r13=125(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 183
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 200
LDI r7, 91
LDI r8, 48
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 131
LDI r12, 376
LDI r13, 125
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
