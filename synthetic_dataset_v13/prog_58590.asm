; DESCRIPTION: Composite: Draws a magenta rectangle at (432, 122) with width 18 and height 28 then Draws a magenta line from (90, 78) to (300, 142).
; PLAN: r0=432(x), r1=122(y), r2=18(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x1), r6=78(y1), r7=300(x2), r8=142(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 122
LDI r2, 18
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 78
LDI r7, 300
LDI r8, 142
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
