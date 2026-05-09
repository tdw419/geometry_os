; DESCRIPTION: Composite: Creates a purple circular shape at (231, 94) with radius 33 then Creates a white rectangular region at (281, 85) spanning 84 by 71 pixels.
; PLAN: r0=231(x), r1=94(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=85(y), r7=84(width), r8=71(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 94
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 85
LDI r7, 84
LDI r8, 71
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
