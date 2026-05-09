; DESCRIPTION: Composite: Creates a purple rectangular region at (102, 75) spanning 13 by 76 pixels then Places a black dot at position (19, 210) then Places a orange circle of radius 12 at center (13, 155).
; PLAN: r0=102(x), r1=75(y), r2=13(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=210(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=13(x), r11=155(y), r12=12(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 102
LDI r1, 75
LDI r2, 13
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 210
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 13
LDI r11, 155
LDI r12, 12
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
