; DESCRIPTION: Composite: Places a orange 64x99 rectangle at position (215, 123) then Draws a yellow circle centered at (24, 43) with radius 23 then Draws a orange line from (65, 250) to (255, 101).
; PLAN: r0=215(x), r1=123(y), r2=64(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x), r6=43(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=65(x1), r11=250(y1), r12=255(x2), r13=101(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 123
LDI r2, 64
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 43
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 65
LDI r11, 250
LDI r12, 255
LDI r13, 101
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
