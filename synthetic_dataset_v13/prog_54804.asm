; DESCRIPTION: Composite: Draws a blue rectangle at (431, 3) with width 81 and height 68 then Draws a orange line from (296, 87) to (154, 102).
; PLAN: r0=431(x), r1=3(y), r2=81(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=296(x1), r6=87(y1), r7=154(x2), r8=102(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 3
LDI r2, 81
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 87
LDI r7, 154
LDI r8, 102
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
