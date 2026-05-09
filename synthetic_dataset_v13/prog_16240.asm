; DESCRIPTION: Composite: Places a cyan 51x96 rectangle at position (325, 95) then Renders a orange line between points (4, 161) and (147, 1) then Places a black circle of radius 58 at center (396, 194).
; PLAN: r0=325(x), r1=95(y), r2=51(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=4(x1), r6=161(y1), r7=147(x2), r8=1(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=194(y), r12=58(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 95
LDI r2, 51
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 161
LDI r7, 147
LDI r8, 1
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 194
LDI r12, 58
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
