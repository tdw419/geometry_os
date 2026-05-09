; DESCRIPTION: Composite: Draws a red circle centered at (414, 40) with radius 30 then Renders a black line between points (132, 30) and (98, 14) then Draws a green rectangle at (267, 185) with width 56 and height 32.
; PLAN: r0=414(x), r1=40(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x1), r6=30(y1), r7=98(x2), r8=14(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=267(x), r11=185(y), r12=56(width), r13=32(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 40
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 30
LDI r7, 98
LDI r8, 14
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 185
LDI r12, 56
LDI r13, 32
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
