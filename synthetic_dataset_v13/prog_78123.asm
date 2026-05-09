; DESCRIPTION: Composite: Creates a black circular shape at (168, 85) with radius 72 then Creates a black rectangular region at (226, 53) spanning 21 by 62 pixels.
; PLAN: r0=168(x), r1=85(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=53(y), r7=21(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 85
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 53
LDI r7, 21
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
