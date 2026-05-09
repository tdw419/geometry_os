; DESCRIPTION: Composite: Creates a red rectangular region at (18, 68) spanning 52 by 34 pixels then Creates a black circular shape at (62, 151) with radius 22.
; PLAN: r0=18(x), r1=68(y), r2=52(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x), r6=151(y), r7=22(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 18
LDI r1, 68
LDI r2, 52
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 151
LDI r7, 22
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
