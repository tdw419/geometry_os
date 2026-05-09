; DESCRIPTION: Composite: Places a yellow 95x65 rectangle at position (76, 166) then Places a cyan line segment connecting (66, 159) to (468, 191) then Creates a black circular shape at (67, 153) with radius 28.
; PLAN: r0=76(x), r1=166(y), r2=95(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x1), r6=159(y1), r7=468(x2), r8=191(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=153(y), r12=28(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 76
LDI r1, 166
LDI r2, 95
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 159
LDI r7, 468
LDI r8, 191
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 153
LDI r12, 28
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
