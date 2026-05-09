; DESCRIPTION: Composite: Places a white line segment connecting (348, 175) to (395, 57) then Draws a red rectangle at (9, 80) with width 81 and height 72.
; PLAN: r0=348(x1), r1=175(y1), r2=395(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=80(y), r7=81(width), r8=72(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 175
LDI r2, 395
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 80
LDI r7, 81
LDI r8, 72
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
