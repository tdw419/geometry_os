; DESCRIPTION: Composite: Places a orange 83x68 rectangle at position (276, 185) then Draws a blue line from (332, 125) to (484, 118).
; PLAN: r0=276(x), r1=185(y), r2=83(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x1), r6=125(y1), r7=484(x2), r8=118(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 185
LDI r2, 83
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 125
LDI r7, 484
LDI r8, 118
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
