; DESCRIPTION: Composite: Renders a purple disk with center (56, 25) and radius 21 then Draws a green rectangle at (356, 20) with width 62 and height 67 then Places a purple line segment connecting (76, 219) to (346, 30).
; PLAN: r0=56(x), r1=25(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=20(y), r7=62(width), r8=67(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x1), r11=219(y1), r12=346(x2), r13=30(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 25
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 20
LDI r7, 62
LDI r8, 67
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 219
LDI r12, 346
LDI r13, 30
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
