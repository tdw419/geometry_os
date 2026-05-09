; DESCRIPTION: Composite: Places a green 112x118 rectangle at position (134, 24) then Creates a green circular shape at (280, 143) with radius 49 then Places a red line segment connecting (82, 137) to (17, 225).
; PLAN: r0=134(x), r1=24(y), r2=112(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=143(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=82(x1), r11=137(y1), r12=17(x2), r13=225(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 24
LDI r2, 112
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 143
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 82
LDI r11, 137
LDI r12, 17
LDI r13, 225
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
