; DESCRIPTION: Composite: Places a orange line segment connecting (371, 72) to (79, 240) then Draws a purple rectangle at (363, 76) with width 56 and height 117.
; PLAN: r0=371(x1), r1=72(y1), r2=79(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=76(y), r7=56(width), r8=117(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 72
LDI r2, 79
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 76
LDI r7, 56
LDI r8, 117
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
