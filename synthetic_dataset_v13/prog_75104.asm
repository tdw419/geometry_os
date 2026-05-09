; DESCRIPTION: Composite: Draws a black line from (250, 62) to (437, 18) then Creates a blue circular shape at (257, 140) with radius 59.
; PLAN: r0=250(x1), r1=62(y1), r2=437(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=140(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 62
LDI r2, 437
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 140
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
