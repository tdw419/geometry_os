; DESCRIPTION: Composite: Renders a red line between points (504, 247) and (203, 14) then Draws a green circle centered at (458, 89) with radius 18.
; PLAN: r0=504(x1), r1=247(y1), r2=203(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=89(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 504
LDI r1, 247
LDI r2, 203
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 89
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
