; DESCRIPTION: Composite: Draws a white circle centered at (104, 136) with radius 80 then Places a blue dot at position (430, 190) then Places a orange line segment connecting (335, 204) to (341, 214).
; PLAN: r0=104(x), r1=136(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=190(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=335(x1), r11=204(y1), r12=341(x2), r13=214(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 136
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 190
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 335
LDI r11, 204
LDI r12, 341
LDI r13, 214
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
