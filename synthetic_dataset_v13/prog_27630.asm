; DESCRIPTION: Composite: Draws a red circle centered at (428, 172) with radius 72 then Renders a white line between points (457, 9) and (3, 180).
; PLAN: r0=428(x), r1=172(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x1), r6=9(y1), r7=3(x2), r8=180(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 172
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 9
LDI r7, 3
LDI r8, 180
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
