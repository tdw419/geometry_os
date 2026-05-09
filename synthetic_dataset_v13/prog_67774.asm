; DESCRIPTION: Composite: Renders a orange line between points (277, 93) and (468, 118) then Sets a single cyan pixel at (6, 87).
; PLAN: r0=277(x1), r1=93(y1), r2=468(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=87(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 93
LDI r2, 468
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 87
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
