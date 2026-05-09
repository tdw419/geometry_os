; DESCRIPTION: Composite: Draws a orange line from (334, 200) to (387, 80) then Places a black circle of radius 13 at center (67, 229) then Draws a yellow rectangle at (18, 64) with width 16 and height 22.
; PLAN: r0=334(x1), r1=200(y1), r2=387(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=229(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x), r11=64(y), r12=16(width), r13=22(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 200
LDI r2, 387
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 229
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 64
LDI r12, 16
LDI r13, 22
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
