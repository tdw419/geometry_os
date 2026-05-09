; DESCRIPTION: Composite: Draws a orange circle centered at (80, 202) with radius 32 then Creates a white rectangular region at (43, 128) spanning 75 by 15 pixels.
; PLAN: r0=80(x), r1=202(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x), r6=128(y), r7=75(width), r8=15(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 202
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 128
LDI r7, 75
LDI r8, 15
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
