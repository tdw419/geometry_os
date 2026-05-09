; DESCRIPTION: Composite: Places a white line segment connecting (495, 113) to (26, 128) then Draws a green rectangle at (338, 54) with width 110 and height 95.
; PLAN: r0=495(x1), r1=113(y1), r2=26(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=54(y), r7=110(width), r8=95(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 113
LDI r2, 26
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 54
LDI r7, 110
LDI r8, 95
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
