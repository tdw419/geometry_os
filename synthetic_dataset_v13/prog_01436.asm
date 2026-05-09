; DESCRIPTION: Composite: Renders a orange line between points (2, 112) and (249, 155) then Draws a orange rectangle at (26, 116) with width 91 and height 103.
; PLAN: r0=2(x1), r1=112(y1), r2=249(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=116(y), r7=91(width), r8=103(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 112
LDI r2, 249
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 116
LDI r7, 91
LDI r8, 103
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
