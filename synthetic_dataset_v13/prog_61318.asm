; DESCRIPTION: Composite: Places a black dot at position (378, 34) then Places a magenta 23x93 rectangle at position (252, 76) then Creates a yellow circular shape at (420, 169) with radius 70.
; PLAN: r0=378(x), r1=34(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=76(y), r7=23(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=420(x), r11=169(y), r12=70(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 378
LDI r1, 34
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 252
LDI r6, 76
LDI r7, 23
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 169
LDI r12, 70
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
