; DESCRIPTION: Composite: Renders a red line between points (180, 89) and (318, 92) then Places a purple dot at position (91, 84).
; PLAN: r0=180(x1), r1=89(y1), r2=318(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=84(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 180
LDI r1, 89
LDI r2, 318
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 84
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
