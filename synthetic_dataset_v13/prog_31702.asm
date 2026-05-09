; DESCRIPTION: Composite: Creates a red rectangular region at (376, 38) spanning 10 by 45 pixels then Places a yellow dot at position (176, 97) then Creates a green circular shape at (220, 160) with radius 43.
; PLAN: r0=376(x), r1=38(y), r2=10(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=97(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=220(x), r11=160(y), r12=43(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 376
LDI r1, 38
LDI r2, 10
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 97
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 220
LDI r11, 160
LDI r12, 43
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
