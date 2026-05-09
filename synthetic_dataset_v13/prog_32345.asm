; DESCRIPTION: Composite: Creates a green rectangular region at (194, 9) spanning 60 by 85 pixels then Draws a white circle centered at (276, 128) with radius 42.
; PLAN: r0=194(x), r1=9(y), r2=60(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=128(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 9
LDI r2, 60
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 128
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
