; DESCRIPTION: Composite: Places a orange line segment connecting (509, 185) to (489, 1) then Draws a yellow rectangle at (365, 67) with width 110 and height 67.
; PLAN: r0=509(x1), r1=185(y1), r2=489(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=67(y), r7=110(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 185
LDI r2, 489
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 67
LDI r7, 110
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
