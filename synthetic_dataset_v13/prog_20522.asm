; DESCRIPTION: Composite: Places a white dot at position (122, 165) then Places a magenta 108x109 rectangle at position (370, 57) then Places a purple circle of radius 52 at center (158, 72).
; PLAN: r0=122(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=57(y), r7=108(width), r8=109(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x), r11=72(y), r12=52(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 165
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 57
LDI r7, 108
LDI r8, 109
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 72
LDI r12, 52
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
