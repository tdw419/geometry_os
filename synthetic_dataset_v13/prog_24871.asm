; DESCRIPTION: Composite: Creates a cyan rectangular region at (361, 176) spanning 96 by 43 pixels then Places a red dot at position (86, 24) then Creates a black circular shape at (164, 163) with radius 38.
; PLAN: r0=361(x), r1=176(y), r2=96(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=24(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=164(x), r11=163(y), r12=38(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 361
LDI r1, 176
LDI r2, 96
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 24
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 164
LDI r11, 163
LDI r12, 38
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
