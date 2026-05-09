; DESCRIPTION: Composite: Sets a single yellow pixel at (219, 19) then Places a black line segment connecting (93, 133) to (337, 27) then Creates a green circular shape at (377, 114) with radius 49.
; PLAN: r0=219(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=93(x1), r6=133(y1), r7=337(x2), r8=27(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=377(x), r11=114(y), r12=49(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 219
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 93
LDI r6, 133
LDI r7, 337
LDI r8, 27
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 114
LDI r12, 49
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
