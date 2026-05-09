; DESCRIPTION: Composite: Creates a blue rectangular region at (306, 114) spanning 72 by 119 pixels then Renders a white disk with center (159, 189) and radius 60 then Places a purple line segment connecting (40, 111) to (184, 4).
; PLAN: r0=306(x), r1=114(y), r2=72(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=189(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x1), r11=111(y1), r12=184(x2), r13=4(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 114
LDI r2, 72
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 189
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 111
LDI r12, 184
LDI r13, 4
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
