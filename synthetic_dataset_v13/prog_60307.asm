; DESCRIPTION: Composite: Creates a purple rectangular region at (16, 133) spanning 31 by 87 pixels then Creates a black circular shape at (182, 66) with radius 64.
; PLAN: r0=16(x), r1=133(y), r2=31(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=66(y), r7=64(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 16
LDI r1, 133
LDI r2, 31
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 66
LDI r7, 64
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
