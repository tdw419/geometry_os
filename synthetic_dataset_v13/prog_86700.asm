; DESCRIPTION: Composite: Draws a orange rectangle at (308, 101) with width 17 and height 56 then Places a cyan circle of radius 45 at center (110, 96) then Draws a yellow line from (165, 66) to (88, 163).
; PLAN: r0=308(x), r1=101(y), r2=17(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=110(x), r6=96(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=165(x1), r11=66(y1), r12=88(x2), r13=163(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 101
LDI r2, 17
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 96
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 165
LDI r11, 66
LDI r12, 88
LDI r13, 163
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
