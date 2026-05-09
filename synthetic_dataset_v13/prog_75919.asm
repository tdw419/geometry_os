; DESCRIPTION: Composite: Creates a yellow circular shape at (343, 61) with radius 36 then Sets a single magenta pixel at (12, 230) then Places a blue line segment connecting (201, 140) to (328, 108).
; PLAN: r0=343(x), r1=61(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=230(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=201(x1), r11=140(y1), r12=328(x2), r13=108(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 61
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 230
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 201
LDI r11, 140
LDI r12, 328
LDI r13, 108
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
