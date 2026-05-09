; DESCRIPTION: Composite: Places a cyan dot at position (403, 232) then Renders a purple line between points (181, 45) and (285, 20) then Renders a blue disk with center (259, 87) and radius 79.
; PLAN: r0=403(x), r1=232(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=181(x1), r6=45(y1), r7=285(x2), r8=20(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=259(x), r11=87(y), r12=79(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 232
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 45
LDI r7, 285
LDI r8, 20
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 87
LDI r12, 79
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
