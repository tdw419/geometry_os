; DESCRIPTION: Composite: Sets a single magenta pixel at (476, 8) then Places a purple line segment connecting (457, 240) to (385, 189).
; PLAN: r0=476(x), r1=8(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=457(x1), r6=240(y1), r7=385(x2), r8=189(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 8
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 457
LDI r6, 240
LDI r7, 385
LDI r8, 189
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
