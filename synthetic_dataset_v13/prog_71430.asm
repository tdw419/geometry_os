; DESCRIPTION: Composite: Draws a yellow line from (222, 48) to (406, 30) then Creates a purple circular shape at (281, 167) with radius 53 then Draws a orange rectangle at (290, 52) with width 23 and height 45.
; PLAN: r0=222(x1), r1=48(y1), r2=406(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=167(y), r7=53(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=290(x), r11=52(y), r12=23(width), r13=45(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 48
LDI r2, 406
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 167
LDI r7, 53
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 290
LDI r11, 52
LDI r12, 23
LDI r13, 45
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
