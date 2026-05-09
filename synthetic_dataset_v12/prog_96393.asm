; DESCRIPTION: Composite: Places a yellow line segment connecting (359, 172) to (388, 232) then Creates a blue circular shape at (452, 210) with radius 29 then Places a purple dot at position (406, 204).
; PLAN: r0=359(x1), r1=172(y1), r2=388(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=210(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=406(x), r11=204(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 359
LDI r1, 172
LDI r2, 388
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 210
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 406
LDI r11, 204
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
