; DESCRIPTION: Composite: Places a orange line segment connecting (82, 153) to (430, 165) then Draws a yellow rectangle at (45, 163) with width 106 and height 67.
; PLAN: r0=82(x1), r1=153(y1), r2=430(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=163(y), r7=106(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 153
LDI r2, 430
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 163
LDI r7, 106
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
