; DESCRIPTION: Composite: Renders a purple line between points (324, 118) and (487, 70) then Places a purple dot at position (501, 27).
; PLAN: r0=324(x1), r1=118(y1), r2=487(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=501(x), r6=27(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 118
LDI r2, 487
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 27
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
