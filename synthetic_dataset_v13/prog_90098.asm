; DESCRIPTION: Composite: Draws a black line from (473, 201) to (89, 52) then Places a magenta circle of radius 34 at center (302, 35).
; PLAN: r0=473(x1), r1=201(y1), r2=89(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=35(y), r7=34(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 473
LDI r1, 201
LDI r2, 89
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 35
LDI r7, 34
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
