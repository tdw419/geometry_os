; DESCRIPTION: Composite: Sets a single blue pixel at (271, 184) then Renders a cyan disk with center (92, 137) and radius 53 then Places a purple line segment connecting (424, 18) to (312, 226).
; PLAN: r0=271(x), r1=184(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=137(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=424(x1), r11=18(y1), r12=312(x2), r13=226(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 184
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 92
LDI r6, 137
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 424
LDI r11, 18
LDI r12, 312
LDI r13, 226
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
