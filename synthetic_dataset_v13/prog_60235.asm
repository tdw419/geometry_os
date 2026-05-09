; DESCRIPTION: Composite: Creates a white circular shape at (157, 62) with radius 32 then Creates a blue rectangular region at (413, 66) spanning 41 by 112 pixels then Sets a single red pixel at (505, 207).
; PLAN: r0=157(x), r1=62(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x), r6=66(y), r7=41(width), r8=112(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=505(x), r11=207(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 157
LDI r1, 62
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 66
LDI r7, 41
LDI r8, 112
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 505
LDI r11, 207
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
