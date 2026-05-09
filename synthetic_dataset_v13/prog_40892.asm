; DESCRIPTION: Composite: Renders a orange line between points (140, 150) and (284, 86) then Places a purple 30x84 rectangle at position (455, 122) then Draws a orange circle centered at (284, 146) with radius 49.
; PLAN: r0=140(x1), r1=150(y1), r2=284(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=122(y), r7=30(width), r8=84(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=284(x), r11=146(y), r12=49(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 140
LDI r1, 150
LDI r2, 284
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 122
LDI r7, 30
LDI r8, 84
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 146
LDI r12, 49
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
