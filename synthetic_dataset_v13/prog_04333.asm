; DESCRIPTION: Composite: Places a yellow 116x23 rectangle at position (252, 144) then Places a red line segment connecting (279, 76) to (259, 52) then Draws a red circle centered at (439, 144) with radius 67.
; PLAN: r0=252(x), r1=144(y), r2=116(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x1), r6=76(y1), r7=259(x2), r8=52(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=439(x), r11=144(y), r12=67(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 252
LDI r1, 144
LDI r2, 116
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 76
LDI r7, 259
LDI r8, 52
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 144
LDI r12, 67
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
