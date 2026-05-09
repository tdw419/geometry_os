; DESCRIPTION: Composite: Places a purple 88x78 rectangle at position (125, 41) then Places a magenta dot at position (497, 231) then Creates a magenta circular shape at (232, 53) with radius 32.
; PLAN: r0=125(x), r1=41(y), r2=88(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=497(x), r6=231(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=232(x), r11=53(y), r12=32(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 41
LDI r2, 88
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 231
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 232
LDI r11, 53
LDI r12, 32
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
