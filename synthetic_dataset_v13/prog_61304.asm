; DESCRIPTION: Composite: Places a white dot at position (143, 113) then Draws a purple circle centered at (170, 110) with radius 77 then Renders a purple line between points (37, 159) and (256, 174).
; PLAN: r0=143(x), r1=113(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=110(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=37(x1), r11=159(y1), r12=256(x2), r13=174(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 113
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 170
LDI r6, 110
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 37
LDI r11, 159
LDI r12, 256
LDI r13, 174
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
