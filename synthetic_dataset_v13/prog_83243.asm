; DESCRIPTION: Composite: Draws a orange line from (190, 76) to (160, 87) then Draws a orange rectangle at (377, 21) with width 77 and height 78.
; PLAN: r0=190(x1), r1=76(y1), r2=160(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=21(y), r7=77(width), r8=78(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 76
LDI r2, 160
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 21
LDI r7, 77
LDI r8, 78
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
