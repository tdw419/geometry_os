; DESCRIPTION: Composite: Draws a orange line from (60, 153) to (322, 106) then Draws a white rectangle at (126, 231) with width 48 and height 12.
; PLAN: r0=60(x1), r1=153(y1), r2=322(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=231(y), r7=48(width), r8=12(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 153
LDI r2, 322
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 231
LDI r7, 48
LDI r8, 12
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
