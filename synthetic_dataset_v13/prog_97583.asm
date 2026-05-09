; DESCRIPTION: Composite: Renders a orange line between points (509, 65) and (130, 241) then Sets a single black pixel at (162, 114).
; PLAN: r0=509(x1), r1=65(y1), r2=130(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=114(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 509
LDI r1, 65
LDI r2, 130
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 114
LDI r7, 0x000000
PSET r5, r6, r7
HALT
