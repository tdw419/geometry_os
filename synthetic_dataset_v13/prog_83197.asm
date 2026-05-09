; DESCRIPTION: Composite: Renders a white disk with center (185, 131) and radius 50 then Draws a red rectangle at (400, 5) with width 52 and height 111 then Draws a orange line from (43, 156) to (258, 63).
; PLAN: r0=185(x), r1=131(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=5(y), r7=52(width), r8=111(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=43(x1), r11=156(y1), r12=258(x2), r13=63(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 131
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 5
LDI r7, 52
LDI r8, 111
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 156
LDI r12, 258
LDI r13, 63
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
