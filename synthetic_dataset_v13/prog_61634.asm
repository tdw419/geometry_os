; DESCRIPTION: Composite: Creates a orange rectangular region at (156, 7) spanning 29 by 116 pixels then Sets a single yellow pixel at (467, 35) then Places a black circle of radius 14 at center (123, 20).
; PLAN: r0=156(x), r1=7(y), r2=29(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=35(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=123(x), r11=20(y), r12=14(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 156
LDI r1, 7
LDI r2, 29
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 35
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 123
LDI r11, 20
LDI r12, 14
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
