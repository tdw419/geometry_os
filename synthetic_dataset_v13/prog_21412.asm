; DESCRIPTION: Composite: Places a red circle of radius 25 at center (481, 110) then Renders a magenta line between points (155, 247) and (268, 100).
; PLAN: r0=481(x), r1=110(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x1), r6=247(y1), r7=268(x2), r8=100(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 481
LDI r1, 110
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 247
LDI r7, 268
LDI r8, 100
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
