; DESCRIPTION: Composite: Draws a white circle centered at (160, 191) with radius 28 then Renders a white line between points (316, 223) and (143, 140).
; PLAN: r0=160(x), r1=191(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x1), r6=223(y1), r7=143(x2), r8=140(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 191
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 223
LDI r7, 143
LDI r8, 140
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
