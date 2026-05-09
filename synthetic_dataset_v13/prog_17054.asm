; DESCRIPTION: Composite: Draws a black line from (250, 83) to (508, 16) then Creates a black circular shape at (389, 95) with radius 14 then Places a green 109x56 rectangle at position (270, 78).
; PLAN: r0=250(x1), r1=83(y1), r2=508(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=95(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=270(x), r11=78(y), r12=109(width), r13=56(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 83
LDI r2, 508
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 95
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 270
LDI r11, 78
LDI r12, 109
LDI r13, 56
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
