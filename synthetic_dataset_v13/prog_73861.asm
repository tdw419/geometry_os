; DESCRIPTION: Composite: Renders a orange line between points (199, 253) and (19, 53) then Sets a single red pixel at (258, 46).
; PLAN: r0=199(x1), r1=253(y1), r2=19(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=46(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 199
LDI r1, 253
LDI r2, 19
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 46
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
