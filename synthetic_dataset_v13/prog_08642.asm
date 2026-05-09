; DESCRIPTION: Composite: Places a red dot at position (62, 9) then Places a black line segment connecting (109, 101) to (246, 183) then Places a green 68x105 rectangle at position (437, 148).
; PLAN: r0=62(x), r1=9(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=101(y1), r7=246(x2), r8=183(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=437(x), r11=148(y), r12=68(width), r13=105(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 9
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 109
LDI r6, 101
LDI r7, 246
LDI r8, 183
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 148
LDI r12, 68
LDI r13, 105
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
