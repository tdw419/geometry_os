; DESCRIPTION: Composite: Places a yellow line segment connecting (423, 85) to (194, 112) then Draws a white rectangle at (202, 5) with width 44 and height 85.
; PLAN: r0=423(x1), r1=85(y1), r2=194(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=5(y), r7=44(width), r8=85(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 85
LDI r2, 194
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 5
LDI r7, 44
LDI r8, 85
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
