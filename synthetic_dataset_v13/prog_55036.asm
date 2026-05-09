; DESCRIPTION: Composite: Sets a single orange pixel at (429, 84) then Renders a blue disk with center (336, 136) and radius 48 then Renders a yellow line between points (447, 139) and (203, 155).
; PLAN: r0=429(x), r1=84(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=136(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=447(x1), r11=139(y1), r12=203(x2), r13=155(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 84
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 336
LDI r6, 136
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 447
LDI r11, 139
LDI r12, 203
LDI r13, 155
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
