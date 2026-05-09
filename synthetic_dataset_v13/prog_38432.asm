; DESCRIPTION: Composite: Creates a black rectangular region at (401, 119) spanning 102 by 107 pixels then Creates a purple circular shape at (432, 184) with radius 29.
; PLAN: r0=401(x), r1=119(y), r2=102(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=184(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 119
LDI r2, 102
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 184
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
