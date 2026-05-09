; DESCRIPTION: Composite: Renders a orange line between points (436, 235) and (103, 87) then Draws a purple rectangle at (111, 21) with width 52 and height 88.
; PLAN: r0=436(x1), r1=235(y1), r2=103(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=21(y), r7=52(width), r8=88(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 235
LDI r2, 103
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 21
LDI r7, 52
LDI r8, 88
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
