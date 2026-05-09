; DESCRIPTION: Composite: Creates a black rectangular region at (343, 0) spanning 23 by 106 pixels then Creates a black circular shape at (208, 40) with radius 29 then Places a red dot at position (29, 242).
; PLAN: r0=343(x), r1=0(y), r2=23(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=40(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=29(x), r11=242(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 0
LDI r2, 23
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 40
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 29
LDI r11, 242
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
