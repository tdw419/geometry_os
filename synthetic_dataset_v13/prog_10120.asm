; DESCRIPTION: Composite: Creates a cyan circular shape at (31, 47) with radius 14 then Creates a orange rectangular region at (353, 86) spanning 81 by 44 pixels.
; PLAN: r0=31(x), r1=47(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=86(y), r7=81(width), r8=44(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 47
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 86
LDI r7, 81
LDI r8, 44
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
