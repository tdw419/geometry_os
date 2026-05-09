; DESCRIPTION: Composite: Creates a orange rectangular region at (233, 10) spanning 44 by 90 pixels then Creates a white circular shape at (456, 123) with radius 34.
; PLAN: r0=233(x), r1=10(y), r2=44(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=123(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 233
LDI r1, 10
LDI r2, 44
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 123
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
