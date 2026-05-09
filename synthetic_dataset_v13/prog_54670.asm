; DESCRIPTION: Composite: Renders a cyan box of size 97x35 starting at (129, 120) then Draws a red line from (328, 227) to (276, 125) then Places a magenta circle of radius 35 at center (55, 155).
; PLAN: r0=129(x), r1=120(y), r2=97(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x1), r6=227(y1), r7=276(x2), r8=125(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=155(y), r12=35(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 120
LDI r2, 97
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 227
LDI r7, 276
LDI r8, 125
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 155
LDI r12, 35
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
