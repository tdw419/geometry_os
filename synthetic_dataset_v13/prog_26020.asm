; DESCRIPTION: Composite: Draws a green circle centered at (266, 85) with radius 14 then Renders a orange line between points (305, 166) and (166, 208).
; PLAN: r0=266(x), r1=85(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x1), r6=166(y1), r7=166(x2), r8=208(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 85
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 166
LDI r7, 166
LDI r8, 208
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
