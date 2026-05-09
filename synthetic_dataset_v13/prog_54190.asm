; DESCRIPTION: Composite: Creates a black rectangular region at (441, 117) spanning 57 by 113 pixels then Places a orange dot at position (67, 172) then Creates a red circular shape at (361, 161) with radius 47.
; PLAN: r0=441(x), r1=117(y), r2=57(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x), r6=172(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=361(x), r11=161(y), r12=47(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 441
LDI r1, 117
LDI r2, 57
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 172
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 361
LDI r11, 161
LDI r12, 47
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
