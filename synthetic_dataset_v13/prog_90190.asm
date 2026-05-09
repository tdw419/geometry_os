; DESCRIPTION: Composite: Places a purple dot at position (265, 66) then Renders a cyan line between points (250, 18) and (276, 162).
; PLAN: r0=265(x), r1=66(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=250(x1), r6=18(y1), r7=276(x2), r8=162(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 66
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 250
LDI r6, 18
LDI r7, 276
LDI r8, 162
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
