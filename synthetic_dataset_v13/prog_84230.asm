; DESCRIPTION: Composite: Places a blue dot at position (498, 204) then Renders a purple disk with center (289, 215) and radius 33 then Renders a black line between points (490, 68) and (200, 73).
; PLAN: r0=498(x), r1=204(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=215(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=490(x1), r11=68(y1), r12=200(x2), r13=73(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 498
LDI r1, 204
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 215
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 490
LDI r11, 68
LDI r12, 200
LDI r13, 73
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
