; DESCRIPTION: Composite: Places a purple dot at position (330, 61) then Renders a purple line between points (195, 140) and (437, 97).
; PLAN: r0=330(x), r1=61(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=195(x1), r6=140(y1), r7=437(x2), r8=97(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 61
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 195
LDI r6, 140
LDI r7, 437
LDI r8, 97
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
