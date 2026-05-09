; DESCRIPTION: Composite: Places a red circle of radius 53 at center (452, 62) then Creates a yellow rectangular region at (48, 141) spanning 41 by 55 pixels then Sets a single black pixel at (226, 156).
; PLAN: r0=452(x), r1=62(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=141(y), r7=41(width), r8=55(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=226(x), r11=156(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 452
LDI r1, 62
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 141
LDI r7, 41
LDI r8, 55
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 156
LDI r12, 0x000000
PSET r10, r11, r12
HALT
