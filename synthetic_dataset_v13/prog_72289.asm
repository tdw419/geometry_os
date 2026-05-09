; DESCRIPTION: Composite: Renders a white line between points (393, 69) and (27, 110) then Sets a single orange pixel at (119, 66).
; PLAN: r0=393(x1), r1=69(y1), r2=27(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=66(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 393
LDI r1, 69
LDI r2, 27
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 66
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
