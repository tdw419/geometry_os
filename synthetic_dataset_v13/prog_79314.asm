; DESCRIPTION: Composite: Draws a cyan rectangle at (252, 136) with width 68 and height 38 then Draws a orange line from (279, 3) to (54, 156) then Places a green circle of radius 10 at center (454, 173).
; PLAN: r0=252(x), r1=136(y), r2=68(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x1), r6=3(y1), r7=54(x2), r8=156(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=454(x), r11=173(y), r12=10(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 252
LDI r1, 136
LDI r2, 68
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 3
LDI r7, 54
LDI r8, 156
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 173
LDI r12, 10
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
