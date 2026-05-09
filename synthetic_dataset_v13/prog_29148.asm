; DESCRIPTION: Composite: Places a white dot at position (310, 229) then Creates a black rectangular region at (426, 126) spanning 73 by 61 pixels then Creates a yellow circular shape at (222, 164) with radius 25.
; PLAN: r0=310(x), r1=229(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=126(y), r7=73(width), r8=61(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=222(x), r11=164(y), r12=25(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 310
LDI r1, 229
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 426
LDI r6, 126
LDI r7, 73
LDI r8, 61
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 164
LDI r12, 25
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
