; DESCRIPTION: Composite: Renders a magenta line between points (310, 25) and (122, 0) then Sets a single orange pixel at (486, 105).
; PLAN: r0=310(x1), r1=25(y1), r2=122(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=486(x), r6=105(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 310
LDI r1, 25
LDI r2, 122
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 105
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
