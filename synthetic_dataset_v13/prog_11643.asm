; DESCRIPTION: Composite: Places a orange dot at position (14, 46) then Places a yellow circle of radius 20 at center (195, 158) then Creates a red rectangular region at (20, 109) spanning 89 by 29 pixels.
; PLAN: r0=14(x), r1=46(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=158(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=20(x), r11=109(y), r12=89(width), r13=29(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 46
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 195
LDI r6, 158
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 20
LDI r11, 109
LDI r12, 89
LDI r13, 29
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
