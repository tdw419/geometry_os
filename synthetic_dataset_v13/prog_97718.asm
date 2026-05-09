; DESCRIPTION: Composite: Places a white line segment connecting (185, 30) to (266, 5) then Draws a orange rectangle at (120, 50) with width 70 and height 16.
; PLAN: r0=185(x1), r1=30(y1), r2=266(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=50(y), r7=70(width), r8=16(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 30
LDI r2, 266
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 50
LDI r7, 70
LDI r8, 16
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
