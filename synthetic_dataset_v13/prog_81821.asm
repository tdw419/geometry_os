; DESCRIPTION: Composite: Places a black line segment connecting (418, 139) to (499, 5) then Renders a orange box of size 16x103 starting at (448, 123) then Renders a red disk with center (133, 83) and radius 34.
; PLAN: r0=418(x1), r1=139(y1), r2=499(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=123(y), r7=16(width), r8=103(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x), r11=83(y), r12=34(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 139
LDI r2, 499
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 123
LDI r7, 16
LDI r8, 103
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 83
LDI r12, 34
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
