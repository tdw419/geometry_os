; DESCRIPTION: Composite: Places a white 69x46 rectangle at position (325, 32) then Draws a black line from (132, 165) to (299, 26) then Places a orange circle of radius 20 at center (442, 88).
; PLAN: r0=325(x), r1=32(y), r2=69(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x1), r6=165(y1), r7=299(x2), r8=26(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=88(y), r12=20(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 32
LDI r2, 69
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 165
LDI r7, 299
LDI r8, 26
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 88
LDI r12, 20
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
