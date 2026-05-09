; DESCRIPTION: Composite: Renders a yellow line between points (190, 174) and (446, 123) then Sets a single white pixel at (37, 180).
; PLAN: r0=190(x1), r1=174(y1), r2=446(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=180(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 190
LDI r1, 174
LDI r2, 446
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 180
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
