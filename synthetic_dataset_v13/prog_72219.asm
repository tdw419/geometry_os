; DESCRIPTION: Composite: Draws a magenta line from (205, 195) to (501, 178) then Draws a orange rectangle at (89, 77) with width 83 and height 13.
; PLAN: r0=205(x1), r1=195(y1), r2=501(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=89(x), r6=77(y), r7=83(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 195
LDI r2, 501
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 77
LDI r7, 83
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
