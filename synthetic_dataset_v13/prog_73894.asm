; DESCRIPTION: Composite: Renders a white line between points (485, 42) and (366, 240) then Sets a single red pixel at (471, 199).
; PLAN: r0=485(x1), r1=42(y1), r2=366(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=471(x), r6=199(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 485
LDI r1, 42
LDI r2, 366
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 199
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
