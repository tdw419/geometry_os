; DESCRIPTION: Composite: Sets a single magenta pixel at (232, 3) then Creates a yellow circular shape at (415, 86) with radius 78 then Places a cyan line segment connecting (159, 3) to (225, 155).
; PLAN: r0=232(x), r1=3(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=86(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=159(x1), r11=3(y1), r12=225(x2), r13=155(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 3
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 415
LDI r6, 86
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 159
LDI r11, 3
LDI r12, 225
LDI r13, 155
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
