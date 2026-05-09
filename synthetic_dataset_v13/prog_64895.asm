; DESCRIPTION: Composite: Renders a blue line between points (301, 125) and (170, 69) then Sets a single red pixel at (369, 95).
; PLAN: r0=301(x1), r1=125(y1), r2=170(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=95(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 125
LDI r2, 170
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 95
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
