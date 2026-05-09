; DESCRIPTION: Composite: Creates a magenta rectangular region at (159, 69) spanning 68 by 83 pixels then Draws a orange line from (493, 212) to (284, 222).
; PLAN: r0=159(x), r1=69(y), r2=68(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=493(x1), r6=212(y1), r7=284(x2), r8=222(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 69
LDI r2, 68
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 212
LDI r7, 284
LDI r8, 222
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
