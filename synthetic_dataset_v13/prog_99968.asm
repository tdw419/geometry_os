; DESCRIPTION: Composite: Places a blue circle of radius 24 at center (359, 57) then Renders a purple line between points (79, 114) and (237, 254).
; PLAN: r0=359(x), r1=57(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x1), r6=114(y1), r7=237(x2), r8=254(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 57
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 114
LDI r7, 237
LDI r8, 254
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
