; DESCRIPTION: Composite: Renders a red line between points (109, 216) and (55, 40) then Places a red circle of radius 37 at center (204, 177).
; PLAN: r0=109(x1), r1=216(y1), r2=55(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=177(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 216
LDI r2, 55
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 177
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
