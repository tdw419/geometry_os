; DESCRIPTION: Composite: Renders a magenta line between points (396, 138) and (404, 163) then Sets a single white pixel at (292, 185).
; PLAN: r0=396(x1), r1=138(y1), r2=404(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=185(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 138
LDI r2, 404
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 185
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
