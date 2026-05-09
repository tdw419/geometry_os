; DESCRIPTION: Composite: Creates a black circular shape at (348, 144) with radius 21 then Creates a cyan rectangular region at (442, 99) spanning 49 by 104 pixels.
; PLAN: r0=348(x), r1=144(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x), r6=99(y), r7=49(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 144
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 99
LDI r7, 49
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
