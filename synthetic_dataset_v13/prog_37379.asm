; DESCRIPTION: Composite: Draws a white line from (474, 4) to (503, 5) then Sets a single purple pixel at (452, 181).
; PLAN: r0=474(x1), r1=4(y1), r2=503(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=181(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 474
LDI r1, 4
LDI r2, 503
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 181
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
