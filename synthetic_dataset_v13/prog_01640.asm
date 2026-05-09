; DESCRIPTION: Composite: Renders a white disk with center (199, 159) and radius 59 then Renders a yellow line between points (347, 50) and (251, 56) then Sets a single green pixel at (489, 249).
; PLAN: r0=199(x), r1=159(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x1), r6=50(y1), r7=251(x2), r8=56(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=489(x), r11=249(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 159
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 50
LDI r7, 251
LDI r8, 56
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 249
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
