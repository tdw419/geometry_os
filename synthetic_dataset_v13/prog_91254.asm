; DESCRIPTION: Composite: Places a orange circle of radius 23 at center (285, 129) then Places a yellow line segment connecting (414, 105) to (417, 238) then Draws a red rectangle at (37, 214) with width 117 and height 35.
; PLAN: r0=285(x), r1=129(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x1), r6=105(y1), r7=417(x2), r8=238(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=37(x), r11=214(y), r12=117(width), r13=35(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 129
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 105
LDI r7, 417
LDI r8, 238
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 214
LDI r12, 117
LDI r13, 35
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
