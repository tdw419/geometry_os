; DESCRIPTION: Composite: Places a red line segment connecting (434, 132) to (116, 132) then Places a yellow 52x30 rectangle at position (438, 130) then Draws a black circle centered at (468, 181) with radius 15.
; PLAN: r0=434(x1), r1=132(y1), r2=116(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=130(y), r7=52(width), r8=30(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=468(x), r11=181(y), r12=15(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 434
LDI r1, 132
LDI r2, 116
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 130
LDI r7, 52
LDI r8, 30
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 468
LDI r11, 181
LDI r12, 15
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
