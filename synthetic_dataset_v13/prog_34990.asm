; DESCRIPTION: Composite: Creates a black circular shape at (130, 134) with radius 77 then Draws a black line from (112, 156) to (19, 238).
; PLAN: r0=130(x), r1=134(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x1), r6=156(y1), r7=19(x2), r8=238(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 134
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 156
LDI r7, 19
LDI r8, 238
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
