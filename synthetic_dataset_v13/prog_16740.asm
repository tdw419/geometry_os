; DESCRIPTION: Composite: Places a purple circle of radius 58 at center (384, 60) then Renders a purple line between points (510, 24) and (55, 220) then Sets a single blue pixel at (40, 31).
; PLAN: r0=384(x), r1=60(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x1), r6=24(y1), r7=55(x2), r8=220(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=40(x), r11=31(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 60
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 24
LDI r7, 55
LDI r8, 220
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 31
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
