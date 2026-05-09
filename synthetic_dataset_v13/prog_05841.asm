; DESCRIPTION: Composite: Places a red line segment connecting (162, 208) to (31, 52) then Draws a red rectangle at (305, 167) with width 47 and height 62.
; PLAN: r0=162(x1), r1=208(y1), r2=31(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=167(y), r7=47(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 208
LDI r2, 31
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 167
LDI r7, 47
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
