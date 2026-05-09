; DESCRIPTION: Composite: Creates a green rectangular region at (227, 151) spanning 15 by 60 pixels then Draws a blue circle centered at (272, 69) with radius 16 then Sets a single orange pixel at (468, 88).
; PLAN: r0=227(x), r1=151(y), r2=15(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=69(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=468(x), r11=88(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 227
LDI r1, 151
LDI r2, 15
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 69
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 468
LDI r11, 88
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
