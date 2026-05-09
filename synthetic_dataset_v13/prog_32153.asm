; DESCRIPTION: Composite: Creates a white circular shape at (47, 110) with radius 26 then Renders a yellow line between points (497, 191) and (242, 110).
; PLAN: r0=47(x), r1=110(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=497(x1), r6=191(y1), r7=242(x2), r8=110(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 110
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 497
LDI r6, 191
LDI r7, 242
LDI r8, 110
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
