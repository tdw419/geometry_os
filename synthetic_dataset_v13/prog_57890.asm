; DESCRIPTION: Composite: Creates a purple rectangular region at (233, 3) spanning 99 by 116 pixels then Creates a cyan circular shape at (89, 188) with radius 34.
; PLAN: r0=233(x), r1=3(y), r2=99(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=188(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 233
LDI r1, 3
LDI r2, 99
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 188
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
