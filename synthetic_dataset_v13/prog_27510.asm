; DESCRIPTION: Composite: Places a red 102x53 rectangle at position (346, 63) then Places a red dot at position (409, 39) then Creates a black circular shape at (122, 46) with radius 35.
; PLAN: r0=346(x), r1=63(y), r2=102(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=39(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=122(x), r11=46(y), r12=35(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 346
LDI r1, 63
LDI r2, 102
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 39
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 122
LDI r11, 46
LDI r12, 35
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
