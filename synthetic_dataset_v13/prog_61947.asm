; DESCRIPTION: Composite: Creates a white rectangular region at (101, 123) spanning 63 by 89 pixels then Creates a cyan circular shape at (278, 46) with radius 30.
; PLAN: r0=101(x), r1=123(y), r2=63(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=46(y), r7=30(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 101
LDI r1, 123
LDI r2, 63
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 46
LDI r7, 30
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
