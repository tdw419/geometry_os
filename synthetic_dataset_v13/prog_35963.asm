; DESCRIPTION: Composite: Renders a magenta line between points (207, 52) and (477, 150) then Draws a yellow circle centered at (395, 173) with radius 38 then Places a green 66x79 rectangle at position (318, 135).
; PLAN: r0=207(x1), r1=52(y1), r2=477(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=173(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=318(x), r11=135(y), r12=66(width), r13=79(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 52
LDI r2, 477
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 173
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 318
LDI r11, 135
LDI r12, 66
LDI r13, 79
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
