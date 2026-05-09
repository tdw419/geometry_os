; DESCRIPTION: Composite: Places a orange 74x82 rectangle at position (121, 46) then Sets a single black pixel at (31, 169) then Creates a cyan circular shape at (72, 95) with radius 67.
; PLAN: r0=121(x), r1=46(y), r2=74(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x), r6=169(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=72(x), r11=95(y), r12=67(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 46
LDI r2, 74
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 169
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 72
LDI r11, 95
LDI r12, 67
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
