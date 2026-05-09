; DESCRIPTION: Composite: Renders a white line between points (458, 207) and (358, 74) then Sets a single purple pixel at (238, 199).
; PLAN: r0=458(x1), r1=207(y1), r2=358(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=199(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 458
LDI r1, 207
LDI r2, 358
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 199
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
