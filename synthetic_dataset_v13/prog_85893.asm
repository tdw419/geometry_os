; DESCRIPTION: Composite: Draws a purple rectangle at (283, 15) with width 70 and height 86 then Draws a orange line from (354, 91) to (462, 173).
; PLAN: r0=283(x), r1=15(y), r2=70(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x1), r6=91(y1), r7=462(x2), r8=173(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 15
LDI r2, 70
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 91
LDI r7, 462
LDI r8, 173
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
