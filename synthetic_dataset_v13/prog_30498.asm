; DESCRIPTION: Composite: Renders a orange line between points (10, 129) and (207, 235) then Draws a purple rectangle at (29, 46) with width 97 and height 81.
; PLAN: r0=10(x1), r1=129(y1), r2=207(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=46(y), r7=97(width), r8=81(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 129
LDI r2, 207
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 46
LDI r7, 97
LDI r8, 81
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
