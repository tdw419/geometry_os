; DESCRIPTION: Composite: Renders a black disk with center (161, 117) and radius 26 then Renders a blue line between points (186, 27) and (334, 11).
; PLAN: r0=161(x), r1=117(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x1), r6=27(y1), r7=334(x2), r8=11(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 117
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 27
LDI r7, 334
LDI r8, 11
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
