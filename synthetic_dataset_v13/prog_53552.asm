; DESCRIPTION: Composite: Renders a blue disk with center (188, 142) and radius 44 then Sets a single yellow pixel at (447, 38) then Renders a purple box of size 45x55 starting at (415, 110).
; PLAN: r0=188(x), r1=142(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x), r6=38(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=110(y), r12=45(width), r13=55(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 142
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 38
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 415
LDI r11, 110
LDI r12, 45
LDI r13, 55
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
