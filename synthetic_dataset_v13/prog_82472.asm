; DESCRIPTION: Composite: Renders a purple line between points (110, 20) and (399, 117) then Draws a blue circle centered at (129, 101) with radius 53 then Draws a red rectangle at (274, 74) with width 43 and height 118.
; PLAN: r0=110(x1), r1=20(y1), r2=399(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=101(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=274(x), r11=74(y), r12=43(width), r13=118(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 20
LDI r2, 399
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 101
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 274
LDI r11, 74
LDI r12, 43
LDI r13, 118
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
