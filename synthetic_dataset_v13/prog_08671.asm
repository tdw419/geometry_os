; DESCRIPTION: Composite: Renders a yellow line between points (338, 188) and (186, 123) then Sets a single magenta pixel at (306, 142).
; PLAN: r0=338(x1), r1=188(y1), r2=186(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=142(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 338
LDI r1, 188
LDI r2, 186
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 142
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
