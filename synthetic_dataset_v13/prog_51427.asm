; DESCRIPTION: Composite: Draws a white circle centered at (246, 143) with radius 17 then Creates a blue rectangular region at (203, 68) spanning 95 by 13 pixels.
; PLAN: r0=246(x), r1=143(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x), r6=68(y), r7=95(width), r8=13(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 143
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 68
LDI r7, 95
LDI r8, 13
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
