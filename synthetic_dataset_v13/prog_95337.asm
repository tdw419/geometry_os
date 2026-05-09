; DESCRIPTION: Composite: Renders a orange line between points (355, 194) and (73, 121) then Places a white dot at position (170, 160).
; PLAN: r0=355(x1), r1=194(y1), r2=73(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=160(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 355
LDI r1, 194
LDI r2, 73
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 160
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
