; DESCRIPTION: Composite: Creates a white circular shape at (142, 112) with radius 38 then Creates a white rectangular region at (212, 116) spanning 110 by 13 pixels then Places a white dot at position (359, 191).
; PLAN: r0=142(x), r1=112(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x), r6=116(y), r7=110(width), r8=13(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=359(x), r11=191(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 112
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 116
LDI r7, 110
LDI r8, 13
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 191
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
