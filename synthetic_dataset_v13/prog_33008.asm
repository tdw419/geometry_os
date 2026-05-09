; DESCRIPTION: Composite: Renders a white line between points (162, 13) and (276, 107) then Places a white circle of radius 75 at center (312, 124).
; PLAN: r0=162(x1), r1=13(y1), r2=276(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=124(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 162
LDI r1, 13
LDI r2, 276
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 124
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
