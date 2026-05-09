; DESCRIPTION: Composite: Renders a black disk with center (155, 60) and radius 23 then Renders a black line between points (237, 120) and (184, 30).
; PLAN: r0=155(x), r1=60(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x1), r6=120(y1), r7=184(x2), r8=30(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 60
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 120
LDI r7, 184
LDI r8, 30
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
