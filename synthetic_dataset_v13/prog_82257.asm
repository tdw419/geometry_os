; DESCRIPTION: Composite: Renders a blue line between points (405, 49) and (75, 134) then Creates a black circular shape at (461, 114) with radius 20.
; PLAN: r0=405(x1), r1=49(y1), r2=75(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=114(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 405
LDI r1, 49
LDI r2, 75
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 114
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
