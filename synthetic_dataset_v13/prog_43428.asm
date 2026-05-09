; DESCRIPTION: Composite: Draws a green circle centered at (311, 133) with radius 74 then Renders a red line between points (133, 96) and (366, 85).
; PLAN: r0=311(x), r1=133(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x1), r6=96(y1), r7=366(x2), r8=85(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 133
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 96
LDI r7, 366
LDI r8, 85
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
