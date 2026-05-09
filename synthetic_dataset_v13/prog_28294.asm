; DESCRIPTION: Composite: Creates a white rectangular region at (46, 170) spanning 84 by 85 pixels then Creates a red circular shape at (320, 65) with radius 60.
; PLAN: r0=46(x), r1=170(y), r2=84(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x), r6=65(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 170
LDI r2, 84
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 65
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
