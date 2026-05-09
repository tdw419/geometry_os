; DESCRIPTION: Composite: Places a magenta line segment connecting (313, 0) to (245, 124) then Creates a red circular shape at (227, 203) with radius 26 then Draws a purple rectangle at (393, 30) with width 86 and height 15.
; PLAN: r0=313(x1), r1=0(y1), r2=245(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=203(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=393(x), r11=30(y), r12=86(width), r13=15(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 0
LDI r2, 245
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 203
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 393
LDI r11, 30
LDI r12, 86
LDI r13, 15
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
