; DESCRIPTION: Composite: Renders a orange disk with center (337, 140) and radius 80 then Renders a black line between points (342, 131) and (302, 131).
; PLAN: r0=337(x), r1=140(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x1), r6=131(y1), r7=302(x2), r8=131(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 140
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 131
LDI r7, 302
LDI r8, 131
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
