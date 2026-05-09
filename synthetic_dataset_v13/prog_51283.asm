; DESCRIPTION: Composite: Places a magenta line segment connecting (396, 41) to (259, 44) then Draws a black rectangle at (176, 49) with width 64 and height 10.
; PLAN: r0=396(x1), r1=41(y1), r2=259(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=49(y), r7=64(width), r8=10(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 41
LDI r2, 259
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 49
LDI r7, 64
LDI r8, 10
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
