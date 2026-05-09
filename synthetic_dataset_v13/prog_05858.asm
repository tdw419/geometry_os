; DESCRIPTION: Composite: Draws a green circle centered at (424, 116) with radius 31 then Renders a red line between points (369, 172) and (433, 29).
; PLAN: r0=424(x), r1=116(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x1), r6=172(y1), r7=433(x2), r8=29(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 116
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 172
LDI r7, 433
LDI r8, 29
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
