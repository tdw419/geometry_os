; DESCRIPTION: Composite: Places a black 63x21 rectangle at position (289, 88) then Draws a orange line from (17, 32) to (239, 53) then Places a black circle of radius 24 at center (232, 78).
; PLAN: r0=289(x), r1=88(y), r2=63(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x1), r6=32(y1), r7=239(x2), r8=53(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=78(y), r12=24(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 289
LDI r1, 88
LDI r2, 63
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 32
LDI r7, 239
LDI r8, 53
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 78
LDI r12, 24
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
