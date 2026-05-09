; DESCRIPTION: Composite: Places a blue dot at position (248, 163) then Places a white circle of radius 78 at center (341, 110) then Draws a purple line from (486, 222) to (16, 67).
; PLAN: r0=248(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=110(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x1), r11=222(y1), r12=16(x2), r13=67(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 163
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 341
LDI r6, 110
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 222
LDI r12, 16
LDI r13, 67
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
