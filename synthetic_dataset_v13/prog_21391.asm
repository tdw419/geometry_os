; DESCRIPTION: Composite: Creates a black circular shape at (420, 111) with radius 67 then Draws a white rectangle at (219, 48) with width 101 and height 105 then Renders a green line between points (79, 34) and (160, 245).
; PLAN: r0=420(x), r1=111(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=48(y), r7=101(width), r8=105(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=79(x1), r11=34(y1), r12=160(x2), r13=245(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 420
LDI r1, 111
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 48
LDI r7, 101
LDI r8, 105
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 34
LDI r12, 160
LDI r13, 245
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
