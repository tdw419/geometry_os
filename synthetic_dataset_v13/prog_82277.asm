; DESCRIPTION: Composite: Places a yellow 16x37 rectangle at position (293, 191) then Creates a black circular shape at (234, 176) with radius 49 then Places a red line segment connecting (323, 207) to (154, 162).
; PLAN: r0=293(x), r1=191(y), r2=16(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=176(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=323(x1), r11=207(y1), r12=154(x2), r13=162(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 191
LDI r2, 16
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 176
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 323
LDI r11, 207
LDI r12, 154
LDI r13, 162
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
