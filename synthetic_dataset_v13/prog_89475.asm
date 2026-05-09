; DESCRIPTION: Composite: Creates a orange rectangular region at (97, 163) spanning 45 by 27 pixels then Places a purple dot at position (125, 82) then Creates a purple circular shape at (441, 210) with radius 14.
; PLAN: r0=97(x), r1=163(y), r2=45(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=82(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=441(x), r11=210(y), r12=14(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 163
LDI r2, 45
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 82
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 441
LDI r11, 210
LDI r12, 14
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
