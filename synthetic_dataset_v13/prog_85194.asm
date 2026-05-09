; DESCRIPTION: Composite: Creates a purple circular shape at (362, 137) with radius 30 then Renders a orange line between points (430, 137) and (333, 15) then Draws a black rectangle at (248, 117) with width 42 and height 38.
; PLAN: r0=362(x), r1=137(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x1), r6=137(y1), r7=333(x2), r8=15(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=248(x), r11=117(y), r12=42(width), r13=38(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 137
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 137
LDI r7, 333
LDI r8, 15
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 117
LDI r12, 42
LDI r13, 38
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
