; DESCRIPTION: Composite: Creates a cyan rectangular region at (193, 98) spanning 99 by 29 pixels then Creates a red circular shape at (183, 158) with radius 31.
; PLAN: r0=193(x), r1=98(y), r2=99(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=158(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 193
LDI r1, 98
LDI r2, 99
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 158
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
