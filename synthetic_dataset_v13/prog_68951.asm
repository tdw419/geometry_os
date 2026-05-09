; DESCRIPTION: Composite: Renders a red line between points (494, 157) and (498, 155) then Draws a orange circle centered at (351, 177) with radius 37 then Places a orange dot at position (392, 191).
; PLAN: r0=494(x1), r1=157(y1), r2=498(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=177(y), r7=37(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=392(x), r11=191(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 494
LDI r1, 157
LDI r2, 498
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 177
LDI r7, 37
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 392
LDI r11, 191
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
