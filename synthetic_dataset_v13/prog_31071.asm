; DESCRIPTION: Composite: Sets a single blue pixel at (359, 150) then Places a white circle of radius 39 at center (322, 124) then Places a orange line segment connecting (83, 131) to (146, 0).
; PLAN: r0=359(x), r1=150(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=124(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=83(x1), r11=131(y1), r12=146(x2), r13=0(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 150
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 124
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 83
LDI r11, 131
LDI r12, 146
LDI r13, 0
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
