; DESCRIPTION: Composite: Renders a purple line between points (406, 235) and (278, 76) then Draws a white rectangle at (235, 57) with width 101 and height 30.
; PLAN: r0=406(x1), r1=235(y1), r2=278(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=57(y), r7=101(width), r8=30(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 235
LDI r2, 278
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 57
LDI r7, 101
LDI r8, 30
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
