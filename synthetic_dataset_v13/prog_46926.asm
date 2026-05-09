; DESCRIPTION: Composite: Draws a orange line from (98, 40) to (74, 119) then Draws a blue circle centered at (359, 45) with radius 20 then Renders a black box of size 86x16 starting at (184, 78).
; PLAN: r0=98(x1), r1=40(y1), r2=74(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=45(y), r7=20(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=184(x), r11=78(y), r12=86(width), r13=16(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 40
LDI r2, 74
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 45
LDI r7, 20
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 184
LDI r11, 78
LDI r12, 86
LDI r13, 16
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
