; DESCRIPTION: Composite: Renders a white line between points (3, 248) and (373, 230) then Draws a orange circle centered at (381, 137) with radius 29.
; PLAN: r0=3(x1), r1=248(y1), r2=373(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=137(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 248
LDI r2, 373
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 137
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
