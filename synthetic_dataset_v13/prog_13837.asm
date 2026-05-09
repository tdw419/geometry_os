; DESCRIPTION: Composite: Renders a orange box of size 41x85 starting at (432, 104) then Draws a yellow line from (369, 30) to (149, 20).
; PLAN: r0=432(x), r1=104(y), r2=41(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x1), r6=30(y1), r7=149(x2), r8=20(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 104
LDI r2, 41
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 30
LDI r7, 149
LDI r8, 20
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
