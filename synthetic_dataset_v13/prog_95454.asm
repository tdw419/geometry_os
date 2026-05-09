; DESCRIPTION: Composite: Renders a black disk with center (88, 196) and radius 54 then Draws a yellow rectangle at (273, 213) with width 73 and height 31 then Places a green line segment connecting (175, 22) to (83, 33).
; PLAN: r0=88(x), r1=196(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=213(y), r7=73(width), r8=31(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=175(x1), r11=22(y1), r12=83(x2), r13=33(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 196
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 213
LDI r7, 73
LDI r8, 31
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 22
LDI r12, 83
LDI r13, 33
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
