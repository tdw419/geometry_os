; DESCRIPTION: Composite: Renders a cyan line between points (478, 171) and (89, 10) then Draws a purple circle centered at (418, 33) with radius 10 then Places a blue dot at position (323, 116).
; PLAN: r0=478(x1), r1=171(y1), r2=89(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=33(y), r7=10(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=323(x), r11=116(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 478
LDI r1, 171
LDI r2, 89
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 33
LDI r7, 10
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 323
LDI r11, 116
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
