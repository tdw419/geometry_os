; DESCRIPTION: Composite: Places a red line segment connecting (56, 39) to (105, 131) then Places a orange 16x11 rectangle at position (439, 217) then Creates a orange circular shape at (117, 36) with radius 28.
; PLAN: r0=56(x1), r1=39(y1), r2=105(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=217(y), r7=16(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=117(x), r11=36(y), r12=28(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 56
LDI r1, 39
LDI r2, 105
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 217
LDI r7, 16
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 36
LDI r12, 28
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
