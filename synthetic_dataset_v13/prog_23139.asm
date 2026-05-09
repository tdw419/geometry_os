; DESCRIPTION: Composite: Creates a black circular shape at (285, 139) with radius 67 then Renders a purple line between points (274, 241) and (381, 16) then Sets a single white pixel at (208, 51).
; PLAN: r0=285(x), r1=139(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x1), r6=241(y1), r7=381(x2), r8=16(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=208(x), r11=51(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 139
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 241
LDI r7, 381
LDI r8, 16
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 51
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
