; DESCRIPTION: Composite: Places a orange line segment connecting (137, 110) to (187, 61) then Renders a magenta box of size 91x41 starting at (297, 123).
; PLAN: r0=137(x1), r1=110(y1), r2=187(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=123(y), r7=91(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 110
LDI r2, 187
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 123
LDI r7, 91
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
