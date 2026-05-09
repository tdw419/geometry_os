; DESCRIPTION: Composite: Draws a white circle centered at (304, 115) with radius 76 then Renders a red line between points (15, 203) and (124, 211).
; PLAN: r0=304(x), r1=115(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x1), r6=203(y1), r7=124(x2), r8=211(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 115
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 203
LDI r7, 124
LDI r8, 211
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
