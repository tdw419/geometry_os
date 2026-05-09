; DESCRIPTION: Composite: Creates a red circular shape at (166, 79) with radius 34 then Creates a red rectangular region at (49, 109) spanning 35 by 87 pixels then Places a white dot at position (462, 187).
; PLAN: r0=166(x), r1=79(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=109(y), r7=35(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=462(x), r11=187(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 166
LDI r1, 79
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 109
LDI r7, 35
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 187
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
