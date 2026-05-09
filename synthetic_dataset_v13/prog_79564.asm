; DESCRIPTION: Composite: Places a white line segment connecting (399, 231) to (256, 250) then Draws a white rectangle at (248, 88) with width 106 and height 120.
; PLAN: r0=399(x1), r1=231(y1), r2=256(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=88(y), r7=106(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 231
LDI r2, 256
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 88
LDI r7, 106
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
