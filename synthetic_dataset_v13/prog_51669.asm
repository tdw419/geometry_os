; DESCRIPTION: Composite: Creates a magenta circular shape at (89, 116) with radius 33 then Creates a white rectangular region at (348, 7) spanning 28 by 23 pixels.
; PLAN: r0=89(x), r1=116(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=7(y), r7=28(width), r8=23(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 116
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 7
LDI r7, 28
LDI r8, 23
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
