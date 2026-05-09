; DESCRIPTION: Composite: Places a red dot at position (189, 123) then Places a orange 17x87 rectangle at position (363, 78) then Draws a yellow circle centered at (208, 176) with radius 43.
; PLAN: r0=189(x), r1=123(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=78(y), r7=17(width), r8=87(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=176(y), r12=43(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 189
LDI r1, 123
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 363
LDI r6, 78
LDI r7, 17
LDI r8, 87
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 176
LDI r12, 43
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
