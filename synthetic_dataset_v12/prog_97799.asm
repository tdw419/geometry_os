; DESCRIPTION: Composite: Draws a red circle centered at (341, 153) with radius 29 then Places a black 116x81 rectangle at position (342, 57) then Places a orange line segment connecting (176, 21) to (191, 102).
; PLAN: r0=341(x), r1=153(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=57(y), r7=116(width), r8=81(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x1), r11=21(y1), r12=191(x2), r13=102(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 153
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 57
LDI r7, 116
LDI r8, 81
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 21
LDI r12, 191
LDI r13, 102
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
