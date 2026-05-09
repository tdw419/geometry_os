; DESCRIPTION: Composite: Renders a white line between points (68, 81) and (445, 141) then Sets a single orange pixel at (86, 199).
; PLAN: r0=68(x1), r1=81(y1), r2=445(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=199(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 68
LDI r1, 81
LDI r2, 445
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 199
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
