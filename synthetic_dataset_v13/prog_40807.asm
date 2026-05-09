; DESCRIPTION: Composite: Draws a yellow circle centered at (353, 106) with radius 77 then Renders a yellow line between points (356, 15) and (26, 96).
; PLAN: r0=353(x), r1=106(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x1), r6=15(y1), r7=26(x2), r8=96(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 106
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 15
LDI r7, 26
LDI r8, 96
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
