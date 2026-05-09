; DESCRIPTION: Composite: Draws a red circle centered at (135, 91) with radius 10 then Renders a red line between points (257, 164) and (55, 71).
; PLAN: r0=135(x), r1=91(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x1), r6=164(y1), r7=55(x2), r8=71(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 91
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 164
LDI r7, 55
LDI r8, 71
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
