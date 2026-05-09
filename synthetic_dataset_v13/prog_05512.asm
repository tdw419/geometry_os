; DESCRIPTION: Composite: Creates a black rectangular region at (307, 161) spanning 74 by 41 pixels then Draws a orange line from (403, 25) to (2, 22).
; PLAN: r0=307(x), r1=161(y), r2=74(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x1), r6=25(y1), r7=2(x2), r8=22(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 161
LDI r2, 74
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 25
LDI r7, 2
LDI r8, 22
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
