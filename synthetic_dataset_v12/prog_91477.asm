; DESCRIPTION: Composite: Creates a orange circular shape at (276, 141) with radius 73 then Creates a black rectangular region at (331, 155) spanning 41 by 47 pixels.
; PLAN: r0=276(x), r1=141(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x), r6=155(y), r7=41(width), r8=47(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 141
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 155
LDI r7, 41
LDI r8, 47
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
