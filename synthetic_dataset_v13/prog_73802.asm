; DESCRIPTION: Composite: Places a red line segment connecting (274, 22) to (489, 171) then Draws a white rectangle at (178, 39) with width 100 and height 40.
; PLAN: r0=274(x1), r1=22(y1), r2=489(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=39(y), r7=100(width), r8=40(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 22
LDI r2, 489
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 39
LDI r7, 100
LDI r8, 40
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
