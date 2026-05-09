; DESCRIPTION: Composite: Renders a purple line between points (173, 139) and (511, 18) then Sets a single orange pixel at (459, 214).
; PLAN: r0=173(x1), r1=139(y1), r2=511(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=214(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 173
LDI r1, 139
LDI r2, 511
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 214
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
