; DESCRIPTION: Composite: Sets a single cyan pixel at (212, 122) then Creates a cyan rectangular region at (422, 41) spanning 14 by 24 pixels then Creates a orange circular shape at (289, 145) with radius 74.
; PLAN: r0=212(x), r1=122(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=41(y), r7=14(width), r8=24(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=289(x), r11=145(y), r12=74(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 212
LDI r1, 122
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 41
LDI r7, 14
LDI r8, 24
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 145
LDI r12, 74
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
