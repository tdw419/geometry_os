; DESCRIPTION: Composite: Places a purple circle of radius 44 at center (309, 210) then Creates a orange rectangular region at (160, 41) spanning 113 by 119 pixels then Sets a single orange pixel at (482, 26).
; PLAN: r0=309(x), r1=210(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=41(y), r7=113(width), r8=119(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=482(x), r11=26(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 309
LDI r1, 210
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 41
LDI r7, 113
LDI r8, 119
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 26
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
