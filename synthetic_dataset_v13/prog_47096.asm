; DESCRIPTION: Composite: Places a black 73x69 rectangle at position (194, 173) then Places a orange dot at position (475, 151) then Places a yellow circle of radius 43 at center (339, 119).
; PLAN: r0=194(x), r1=173(y), r2=73(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=475(x), r6=151(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=339(x), r11=119(y), r12=43(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 194
LDI r1, 173
LDI r2, 73
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 151
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 339
LDI r11, 119
LDI r12, 43
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
