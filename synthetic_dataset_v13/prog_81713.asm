; DESCRIPTION: Composite: Places a blue circle of radius 17 at center (439, 66) then Renders a purple line between points (274, 57) and (396, 4).
; PLAN: r0=439(x), r1=66(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x1), r6=57(y1), r7=396(x2), r8=4(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 66
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 57
LDI r7, 396
LDI r8, 4
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
