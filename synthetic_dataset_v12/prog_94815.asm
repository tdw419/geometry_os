; DESCRIPTION: Composite: Creates a cyan circular shape at (318, 94) with radius 64 then Creates a blue rectangular region at (285, 122) spanning 43 by 69 pixels.
; PLAN: r0=318(x), r1=94(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=122(y), r7=43(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 94
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 122
LDI r7, 43
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
