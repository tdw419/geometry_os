; DESCRIPTION: Composite: Renders a black box of size 90x63 starting at (227, 97) then Places a white circle of radius 39 at center (129, 67) then Draws a orange line from (63, 103) to (232, 143).
; PLAN: r0=227(x), r1=97(y), r2=90(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=67(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=63(x1), r11=103(y1), r12=232(x2), r13=143(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 97
LDI r2, 90
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 67
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 63
LDI r11, 103
LDI r12, 232
LDI r13, 143
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
