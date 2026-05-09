; DESCRIPTION: Composite: Creates a orange rectangular region at (62, 91) spanning 21 by 90 pixels then Creates a blue circular shape at (304, 132) with radius 76.
; PLAN: r0=62(x), r1=91(y), r2=21(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=132(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 62
LDI r1, 91
LDI r2, 21
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 132
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
