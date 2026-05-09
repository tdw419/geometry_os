; DESCRIPTION: Composite: Places a purple line segment connecting (371, 147) to (455, 220) then Creates a white circular shape at (273, 125) with radius 59.
; PLAN: r0=371(x1), r1=147(y1), r2=455(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=125(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 147
LDI r2, 455
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 125
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
