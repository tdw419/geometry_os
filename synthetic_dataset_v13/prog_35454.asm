; DESCRIPTION: Composite: Draws a magenta rectangle at (403, 157) with width 98 and height 26 then Creates a green circular shape at (201, 90) with radius 53 then Renders a orange line between points (14, 18) and (27, 13).
; PLAN: r0=403(x), r1=157(y), r2=98(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=90(y), r7=53(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=14(x1), r11=18(y1), r12=27(x2), r13=13(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 403
LDI r1, 157
LDI r2, 98
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 90
LDI r7, 53
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 14
LDI r11, 18
LDI r12, 27
LDI r13, 13
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
