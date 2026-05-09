; DESCRIPTION: Composite: Places a black circle of radius 13 at center (431, 164) then Draws a green line from (441, 254) to (397, 9) then Renders a green box of size 88x24 starting at (370, 227).
; PLAN: r0=431(x), r1=164(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x1), r6=254(y1), r7=397(x2), r8=9(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=370(x), r11=227(y), r12=88(width), r13=24(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 164
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 254
LDI r7, 397
LDI r8, 9
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 227
LDI r12, 88
LDI r13, 24
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
