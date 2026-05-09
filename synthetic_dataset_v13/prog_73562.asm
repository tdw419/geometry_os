; DESCRIPTION: Composite: Renders a black line between points (483, 242) and (13, 58) then Places a black circle of radius 60 at center (141, 105).
; PLAN: r0=483(x1), r1=242(y1), r2=13(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=105(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 242
LDI r2, 13
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 105
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
