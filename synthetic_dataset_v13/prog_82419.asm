; DESCRIPTION: Composite: Sets a single blue pixel at (204, 163) then Places a magenta circle of radius 57 at center (261, 108) then Places a yellow line segment connecting (324, 70) to (304, 44).
; PLAN: r0=204(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=108(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=324(x1), r11=70(y1), r12=304(x2), r13=44(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 163
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 108
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 324
LDI r11, 70
LDI r12, 304
LDI r13, 44
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
