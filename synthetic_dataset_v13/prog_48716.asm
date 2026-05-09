; DESCRIPTION: Composite: Creates a black circular shape at (129, 158) with radius 73 then Places a blue line segment connecting (272, 41) to (403, 92) then Sets a single red pixel at (409, 87).
; PLAN: r0=129(x), r1=158(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x1), r6=41(y1), r7=403(x2), r8=92(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=87(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 129
LDI r1, 158
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 41
LDI r7, 403
LDI r8, 92
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 87
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
