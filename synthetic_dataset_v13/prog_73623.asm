; DESCRIPTION: Composite: Draws a orange rectangle at (194, 188) with width 67 and height 45 then Places a orange line segment connecting (219, 58) to (369, 108).
; PLAN: r0=194(x), r1=188(y), r2=67(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x1), r6=58(y1), r7=369(x2), r8=108(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 188
LDI r2, 67
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 58
LDI r7, 369
LDI r8, 108
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
