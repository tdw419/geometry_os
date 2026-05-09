; DESCRIPTION: Composite: Draws a purple rectangle at (100, 144) with width 87 and height 94 then Places a orange line segment connecting (412, 234) to (462, 38).
; PLAN: r0=100(x), r1=144(y), r2=87(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x1), r6=234(y1), r7=462(x2), r8=38(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 144
LDI r2, 87
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 234
LDI r7, 462
LDI r8, 38
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
