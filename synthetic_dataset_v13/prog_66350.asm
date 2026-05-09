; DESCRIPTION: Composite: Sets a single white pixel at (106, 236) then Draws a yellow circle centered at (420, 20) with radius 17 then Places a purple line segment connecting (31, 191) to (338, 180).
; PLAN: r0=106(x), r1=236(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=20(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=31(x1), r11=191(y1), r12=338(x2), r13=180(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 236
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 20
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 31
LDI r11, 191
LDI r12, 338
LDI r13, 180
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
