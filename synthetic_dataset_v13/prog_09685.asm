; DESCRIPTION: Composite: Places a orange line segment connecting (65, 11) to (371, 109) then Draws a white circle centered at (115, 130) with radius 44 then Creates a green rectangular region at (383, 39) spanning 63 by 23 pixels.
; PLAN: r0=65(x1), r1=11(y1), r2=371(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=130(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x), r11=39(y), r12=63(width), r13=23(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 11
LDI r2, 371
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 130
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 39
LDI r12, 63
LDI r13, 23
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
