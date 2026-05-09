; DESCRIPTION: Composite: Draws a red circle centered at (302, 146) with radius 55 then Renders a yellow line between points (22, 85) and (250, 217).
; PLAN: r0=302(x), r1=146(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x1), r6=85(y1), r7=250(x2), r8=217(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 146
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 85
LDI r7, 250
LDI r8, 217
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
