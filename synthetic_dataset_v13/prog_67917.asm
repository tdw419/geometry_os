; DESCRIPTION: Composite: Creates a black circular shape at (425, 97) with radius 78 then Renders a black line between points (189, 207) and (506, 216).
; PLAN: r0=425(x), r1=97(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x1), r6=207(y1), r7=506(x2), r8=216(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 97
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 207
LDI r7, 506
LDI r8, 216
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
