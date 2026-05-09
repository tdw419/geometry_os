; DESCRIPTION: Composite: Places a black line segment connecting (213, 0) to (160, 6) then Creates a black rectangular region at (419, 83) spanning 84 by 26 pixels then Draws a magenta circle centered at (244, 92) with radius 80.
; PLAN: r0=213(x1), r1=0(y1), r2=160(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=83(y), r7=84(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=244(x), r11=92(y), r12=80(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 213
LDI r1, 0
LDI r2, 160
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 83
LDI r7, 84
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 92
LDI r12, 80
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
