; DESCRIPTION: Composite: Draws a black circle centered at (301, 60) with radius 46 then Places a orange 29x11 rectangle at position (2, 87) then Places a red line segment connecting (332, 90) to (399, 118).
; PLAN: r0=301(x), r1=60(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=87(y), r7=29(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=332(x1), r11=90(y1), r12=399(x2), r13=118(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 60
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 87
LDI r7, 29
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 90
LDI r12, 399
LDI r13, 118
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
