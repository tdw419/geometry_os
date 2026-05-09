; DESCRIPTION: Composite: Draws a magenta line from (404, 160) to (132, 0) then Draws a purple rectangle at (229, 155) with width 45 and height 26.
; PLAN: r0=404(x1), r1=160(y1), r2=132(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=155(y), r7=45(width), r8=26(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 160
LDI r2, 132
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 155
LDI r7, 45
LDI r8, 26
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
