; DESCRIPTION: Composite: Draws a blue circle centered at (207, 148) with radius 25 then Renders a red line between points (12, 140) and (3, 77).
; PLAN: r0=207(x), r1=148(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x1), r6=140(y1), r7=3(x2), r8=77(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 148
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 140
LDI r7, 3
LDI r8, 77
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
