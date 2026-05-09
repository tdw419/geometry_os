; DESCRIPTION: Composite: Draws a white circle centered at (302, 53) with radius 31 then Renders a yellow line between points (111, 41) and (75, 214).
; PLAN: r0=302(x), r1=53(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x1), r6=41(y1), r7=75(x2), r8=214(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 53
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 41
LDI r7, 75
LDI r8, 214
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
