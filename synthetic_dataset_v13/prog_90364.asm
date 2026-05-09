; DESCRIPTION: Composite: Places a orange line segment connecting (301, 9) to (165, 74) then Draws a red rectangle at (307, 19) with width 61 and height 12.
; PLAN: r0=301(x1), r1=9(y1), r2=165(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=19(y), r7=61(width), r8=12(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 9
LDI r2, 165
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 19
LDI r7, 61
LDI r8, 12
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
