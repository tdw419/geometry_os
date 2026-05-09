; DESCRIPTION: Composite: Renders a green line between points (155, 56) and (52, 78) then Renders a orange disk with center (285, 73) and radius 58 then Sets a single red pixel at (292, 196).
; PLAN: r0=155(x1), r1=56(y1), r2=52(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=73(y), r7=58(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=292(x), r11=196(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 56
LDI r2, 52
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 73
LDI r7, 58
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 292
LDI r11, 196
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
