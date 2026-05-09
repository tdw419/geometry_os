; DESCRIPTION: Composite: Creates a purple circular shape at (89, 143) with radius 75 then Draws a orange line from (441, 55) to (444, 27) then Places a blue 63x43 rectangle at position (148, 4).
; PLAN: r0=89(x), r1=143(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x1), r6=55(y1), r7=444(x2), r8=27(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=4(y), r12=63(width), r13=43(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 143
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 55
LDI r7, 444
LDI r8, 27
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 4
LDI r12, 63
LDI r13, 43
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
