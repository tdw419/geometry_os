; DESCRIPTION: Composite: Renders a purple line between points (433, 39) and (357, 89) then Places a magenta dot at position (389, 35).
; PLAN: r0=433(x1), r1=39(y1), r2=357(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=35(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 433
LDI r1, 39
LDI r2, 357
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 35
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
