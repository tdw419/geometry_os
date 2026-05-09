; DESCRIPTION: Composite: Draws a black rectangle at (119, 201) with width 74 and height 28 then Draws a purple circle centered at (462, 61) with radius 50 then Places a black line segment connecting (453, 25) to (358, 66).
; PLAN: r0=119(x), r1=201(y), r2=74(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=61(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=453(x1), r11=25(y1), r12=358(x2), r13=66(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 201
LDI r2, 74
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 61
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 453
LDI r11, 25
LDI r12, 358
LDI r13, 66
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
