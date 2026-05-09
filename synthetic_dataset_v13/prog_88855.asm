; DESCRIPTION: Composite: Sets a single white pixel at (297, 163) then Creates a orange circular shape at (44, 125) with radius 11 then Places a blue line segment connecting (466, 192) to (494, 108).
; PLAN: r0=297(x), r1=163(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=44(x), r6=125(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=466(x1), r11=192(y1), r12=494(x2), r13=108(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 163
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 44
LDI r6, 125
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 466
LDI r11, 192
LDI r12, 494
LDI r13, 108
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
