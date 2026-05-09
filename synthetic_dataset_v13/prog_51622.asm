; DESCRIPTION: Composite: Renders a orange line between points (235, 139) and (18, 154) then Sets a single magenta pixel at (306, 160).
; PLAN: r0=235(x1), r1=139(y1), r2=18(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=160(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 139
LDI r2, 18
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 160
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
