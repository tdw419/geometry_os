; DESCRIPTION: Composite: Sets a single white pixel at (6, 83) then Creates a yellow circular shape at (450, 109) with radius 49 then Places a black line segment connecting (396, 114) to (451, 14).
; PLAN: r0=6(x), r1=83(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=109(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x1), r11=114(y1), r12=451(x2), r13=14(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 83
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 450
LDI r6, 109
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 114
LDI r12, 451
LDI r13, 14
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
