; DESCRIPTION: Composite: Places a yellow line segment connecting (119, 180) to (115, 85) then Draws a green rectangle at (124, 124) with width 43 and height 66.
; PLAN: r0=119(x1), r1=180(y1), r2=115(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=124(y), r7=43(width), r8=66(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 180
LDI r2, 115
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 124
LDI r7, 43
LDI r8, 66
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
