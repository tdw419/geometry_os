; DESCRIPTION: Composite: Renders a red disk with center (276, 137) and radius 31 then Renders a red line between points (308, 233) and (217, 50).
; PLAN: r0=276(x), r1=137(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x1), r6=233(y1), r7=217(x2), r8=50(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 137
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 233
LDI r7, 217
LDI r8, 50
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
