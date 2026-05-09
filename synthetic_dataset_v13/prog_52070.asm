; DESCRIPTION: Composite: Sets a single white pixel at (212, 84) then Places a red circle of radius 17 at center (185, 63) then Places a blue line segment connecting (268, 83) to (77, 207).
; PLAN: r0=212(x), r1=84(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=63(y), r7=17(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x1), r11=83(y1), r12=77(x2), r13=207(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 84
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 185
LDI r6, 63
LDI r7, 17
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 83
LDI r12, 77
LDI r13, 207
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
