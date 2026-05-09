; DESCRIPTION: Composite: Draws a orange circle centered at (311, 49) with radius 48 then Creates a white rectangular region at (94, 21) spanning 52 by 75 pixels.
; PLAN: r0=311(x), r1=49(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=21(y), r7=52(width), r8=75(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 49
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 21
LDI r7, 52
LDI r8, 75
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
