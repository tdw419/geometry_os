; DESCRIPTION: Composite: Renders a blue line between points (279, 202) and (290, 216) then Places a yellow circle of radius 26 at center (163, 49).
; PLAN: r0=279(x1), r1=202(y1), r2=290(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=49(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 202
LDI r2, 290
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 49
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
