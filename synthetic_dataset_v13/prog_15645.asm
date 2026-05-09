; DESCRIPTION: Composite: Renders a black box of size 29x21 starting at (276, 6) then Places a purple dot at position (323, 76) then Creates a red circular shape at (411, 163) with radius 24.
; PLAN: r0=276(x), r1=6(y), r2=29(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=76(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=411(x), r11=163(y), r12=24(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 276
LDI r1, 6
LDI r2, 29
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 76
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 411
LDI r11, 163
LDI r12, 24
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
