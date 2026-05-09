; DESCRIPTION: Composite: Places a red circle of radius 21 at center (273, 167) then Renders a red line between points (122, 104) and (4, 174).
; PLAN: r0=273(x), r1=167(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x1), r6=104(y1), r7=4(x2), r8=174(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 167
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 104
LDI r7, 4
LDI r8, 174
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
