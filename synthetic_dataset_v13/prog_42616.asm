; DESCRIPTION: Composite: Places a black line segment connecting (60, 166) to (423, 75) then Places a black circle of radius 17 at center (105, 181).
; PLAN: r0=60(x1), r1=166(y1), r2=423(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=181(y), r7=17(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 60
LDI r1, 166
LDI r2, 423
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 181
LDI r7, 17
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
