; DESCRIPTION: Composite: Renders a yellow line between points (248, 119) and (161, 72) then Places a yellow circle of radius 55 at center (216, 92).
; PLAN: r0=248(x1), r1=119(y1), r2=161(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=92(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 119
LDI r2, 161
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 92
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
