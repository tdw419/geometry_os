; DESCRIPTION: Composite: Draws a green rectangle at (99, 2) with width 50 and height 108 then Draws a red line from (260, 122) to (233, 66).
; PLAN: r0=99(x), r1=2(y), r2=50(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x1), r6=122(y1), r7=233(x2), r8=66(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 2
LDI r2, 50
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 122
LDI r7, 233
LDI r8, 66
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
