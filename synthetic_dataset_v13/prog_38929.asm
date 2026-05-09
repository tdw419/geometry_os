; DESCRIPTION: Composite: Renders a yellow line between points (419, 155) and (82, 17) then Places a blue circle of radius 36 at center (475, 110).
; PLAN: r0=419(x1), r1=155(y1), r2=82(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=475(x), r6=110(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 419
LDI r1, 155
LDI r2, 82
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 110
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
