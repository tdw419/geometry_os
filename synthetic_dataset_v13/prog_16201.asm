; DESCRIPTION: Composite: Places a green 22x51 rectangle at position (338, 113) then Draws a blue line from (314, 34) to (308, 203) then Places a black circle of radius 12 at center (361, 176).
; PLAN: r0=338(x), r1=113(y), r2=22(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x1), r6=34(y1), r7=308(x2), r8=203(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=361(x), r11=176(y), r12=12(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 338
LDI r1, 113
LDI r2, 22
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 34
LDI r7, 308
LDI r8, 203
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 361
LDI r11, 176
LDI r12, 12
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
