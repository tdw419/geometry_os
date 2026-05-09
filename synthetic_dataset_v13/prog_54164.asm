; DESCRIPTION: Composite: Draws a green rectangle at (226, 83) with width 75 and height 73 then Places a black circle of radius 38 at center (348, 163) then Places a purple line segment connecting (346, 159) to (477, 136).
; PLAN: r0=226(x), r1=83(y), r2=75(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=163(y), r7=38(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=346(x1), r11=159(y1), r12=477(x2), r13=136(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 226
LDI r1, 83
LDI r2, 75
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 163
LDI r7, 38
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 346
LDI r11, 159
LDI r12, 477
LDI r13, 136
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
