; DESCRIPTION: Composite: Draws a orange line from (70, 118) to (414, 182) then Renders a yellow box of size 41x52 starting at (333, 174).
; PLAN: r0=70(x1), r1=118(y1), r2=414(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=174(y), r7=41(width), r8=52(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 118
LDI r2, 414
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 174
LDI r7, 41
LDI r8, 52
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
