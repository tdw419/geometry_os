; DESCRIPTION: Composite: Creates a red rectangular region at (348, 56) spanning 83 by 39 pixels then Places a green dot at position (134, 245) then Creates a orange circular shape at (410, 145) with radius 58.
; PLAN: r0=348(x), r1=56(y), r2=83(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=134(x), r6=245(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=410(x), r11=145(y), r12=58(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 56
LDI r2, 83
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 245
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 410
LDI r11, 145
LDI r12, 58
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
