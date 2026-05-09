; DESCRIPTION: Composite: Draws a white rectangle at (52, 183) with width 47 and height 72 then Renders a white disk with center (376, 138) and radius 36 then Draws a orange line from (316, 208) to (242, 248).
; PLAN: r0=52(x), r1=183(y), r2=47(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x), r6=138(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=316(x1), r11=208(y1), r12=242(x2), r13=248(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 183
LDI r2, 47
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 138
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 316
LDI r11, 208
LDI r12, 242
LDI r13, 248
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
