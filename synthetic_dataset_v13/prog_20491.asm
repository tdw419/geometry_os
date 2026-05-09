; DESCRIPTION: Composite: Draws a white line from (195, 164) to (313, 173) then Sets a single white pixel at (30, 185).
; PLAN: r0=195(x1), r1=164(y1), r2=313(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=30(x), r6=185(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 195
LDI r1, 164
LDI r2, 313
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 185
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
