; DESCRIPTION: Composite: Places a red line segment connecting (55, 169) to (5, 150) then Draws a white rectangle at (251, 49) with width 103 and height 84.
; PLAN: r0=55(x1), r1=169(y1), r2=5(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=49(y), r7=103(width), r8=84(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 169
LDI r2, 5
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 49
LDI r7, 103
LDI r8, 84
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
