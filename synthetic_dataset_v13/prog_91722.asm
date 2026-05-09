; DESCRIPTION: Composite: Renders a white line between points (317, 80) and (140, 65) then Sets a single white pixel at (77, 82).
; PLAN: r0=317(x1), r1=80(y1), r2=140(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=82(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 317
LDI r1, 80
LDI r2, 140
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 82
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
