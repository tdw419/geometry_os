; DESCRIPTION: Composite: Places a green line segment connecting (138, 140) to (450, 4) then Sets a single yellow pixel at (268, 75).
; PLAN: r0=138(x1), r1=140(y1), r2=450(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=75(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 138
LDI r1, 140
LDI r2, 450
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 75
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
