; DESCRIPTION: Composite: Places a white line segment connecting (477, 26) to (91, 54) then Sets a single purple pixel at (35, 164).
; PLAN: r0=477(x1), r1=26(y1), r2=91(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=164(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 477
LDI r1, 26
LDI r2, 91
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 164
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
