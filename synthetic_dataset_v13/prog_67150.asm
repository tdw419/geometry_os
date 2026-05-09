; DESCRIPTION: Composite: Renders a blue line between points (161, 103) and (437, 20) then Renders a black disk with center (452, 221) and radius 20.
; PLAN: r0=161(x1), r1=103(y1), r2=437(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=221(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 161
LDI r1, 103
LDI r2, 437
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 221
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
