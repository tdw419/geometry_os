; DESCRIPTION: Composite: Renders a white box of size 85x117 starting at (94, 122) then Draws a yellow line from (426, 133) to (52, 50) then Draws a cyan circle centered at (244, 118) with radius 24.
; PLAN: r0=94(x), r1=122(y), r2=85(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x1), r6=133(y1), r7=52(x2), r8=50(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=118(y), r12=24(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 122
LDI r2, 85
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 133
LDI r7, 52
LDI r8, 50
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 118
LDI r12, 24
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
