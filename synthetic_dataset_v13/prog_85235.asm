; DESCRIPTION: Composite: Creates a green circular shape at (419, 157) with radius 41 then Places a black dot at position (309, 23) then Creates a purple rectangular region at (187, 17) spanning 65 by 49 pixels.
; PLAN: r0=419(x), r1=157(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=23(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=187(x), r11=17(y), r12=65(width), r13=49(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 157
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 23
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 187
LDI r11, 17
LDI r12, 65
LDI r13, 49
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
