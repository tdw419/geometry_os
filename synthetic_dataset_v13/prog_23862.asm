; DESCRIPTION: Composite: Renders a red disk with center (276, 68) and radius 31 then Places a red line segment connecting (323, 119) to (232, 83) then Places a red dot at position (400, 155).
; PLAN: r0=276(x), r1=68(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x1), r6=119(y1), r7=232(x2), r8=83(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=400(x), r11=155(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 276
LDI r1, 68
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 119
LDI r7, 232
LDI r8, 83
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 155
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
