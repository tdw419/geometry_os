; DESCRIPTION: Composite: Creates a black circular shape at (248, 91) with radius 45 then Creates a orange rectangular region at (260, 76) spanning 89 by 47 pixels.
; PLAN: r0=248(x), r1=91(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=76(y), r7=89(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 91
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 76
LDI r7, 89
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
