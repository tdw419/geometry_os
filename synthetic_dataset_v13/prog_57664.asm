; DESCRIPTION: Composite: Places a red line segment connecting (292, 251) to (442, 11) then Sets a single white pixel at (199, 175).
; PLAN: r0=292(x1), r1=251(y1), r2=442(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=175(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 251
LDI r2, 442
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 175
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
