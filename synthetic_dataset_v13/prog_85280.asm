; DESCRIPTION: Composite: Renders a magenta line between points (483, 125) and (486, 255) then Places a purple dot at position (504, 205).
; PLAN: r0=483(x1), r1=125(y1), r2=486(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=504(x), r6=205(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 483
LDI r1, 125
LDI r2, 486
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 205
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
