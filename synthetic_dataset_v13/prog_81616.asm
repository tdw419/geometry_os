; DESCRIPTION: Composite: Draws a orange rectangle at (165, 9) with width 14 and height 59 then Places a purple line segment connecting (100, 125) to (303, 140).
; PLAN: r0=165(x), r1=9(y), r2=14(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x1), r6=125(y1), r7=303(x2), r8=140(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 9
LDI r2, 14
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 125
LDI r7, 303
LDI r8, 140
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
