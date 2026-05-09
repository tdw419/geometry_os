; DESCRIPTION: Composite: Places a white dot at position (26, 158) then Places a blue circle of radius 52 at center (437, 134) then Places a orange 33x69 rectangle at position (105, 156).
; PLAN: r0=26(x), r1=158(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=437(x), r6=134(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=105(x), r11=156(y), r12=33(width), r13=69(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 158
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 437
LDI r6, 134
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 105
LDI r11, 156
LDI r12, 33
LDI r13, 69
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
