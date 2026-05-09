; DESCRIPTION: Composite: Draws a orange line from (354, 150) to (381, 91) then Draws a orange rectangle at (18, 81) with width 112 and height 97.
; PLAN: r0=354(x1), r1=150(y1), r2=381(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=81(y), r7=112(width), r8=97(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 150
LDI r2, 381
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 81
LDI r7, 112
LDI r8, 97
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
