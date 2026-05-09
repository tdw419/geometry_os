; DESCRIPTION: Composite: Renders a red line between points (3, 52) and (67, 164) then Draws a orange rectangle at (90, 198) with width 101 and height 43.
; PLAN: r0=3(x1), r1=52(y1), r2=67(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=198(y), r7=101(width), r8=43(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 52
LDI r2, 67
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 198
LDI r7, 101
LDI r8, 43
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
