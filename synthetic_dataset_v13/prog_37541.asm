; DESCRIPTION: Composite: Renders a white box of size 73x25 starting at (138, 52) then Draws a orange line from (29, 160) to (34, 195) then Places a red circle of radius 10 at center (76, 206).
; PLAN: r0=138(x), r1=52(y), r2=73(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x1), r6=160(y1), r7=34(x2), r8=195(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=76(x), r11=206(y), r12=10(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 138
LDI r1, 52
LDI r2, 73
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 160
LDI r7, 34
LDI r8, 195
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 206
LDI r12, 10
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
