; DESCRIPTION: Composite: Sets a single green pixel at (367, 156) then Renders a purple line between points (304, 88) and (338, 68) then Places a green circle of radius 79 at center (248, 120).
; PLAN: r0=367(x), r1=156(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=304(x1), r6=88(y1), r7=338(x2), r8=68(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=248(x), r11=120(y), r12=79(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 367
LDI r1, 156
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 304
LDI r6, 88
LDI r7, 338
LDI r8, 68
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 120
LDI r12, 79
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
