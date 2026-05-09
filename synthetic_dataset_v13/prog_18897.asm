; DESCRIPTION: Composite: Creates a white rectangular region at (304, 205) spanning 80 by 47 pixels then Creates a purple circular shape at (374, 158) with radius 36.
; PLAN: r0=304(x), r1=205(y), r2=80(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=158(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 304
LDI r1, 205
LDI r2, 80
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 158
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
