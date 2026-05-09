; DESCRIPTION: Composite: Places a red line segment connecting (424, 50) to (480, 169) then Draws a magenta rectangle at (469, 18) with width 29 and height 30.
; PLAN: r0=424(x1), r1=50(y1), r2=480(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=18(y), r7=29(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 50
LDI r2, 480
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 18
LDI r7, 29
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
