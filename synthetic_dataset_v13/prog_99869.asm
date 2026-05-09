; DESCRIPTION: Composite: Renders a yellow line between points (439, 2) and (299, 128) then Sets a single purple pixel at (495, 220).
; PLAN: r0=439(x1), r1=2(y1), r2=299(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=495(x), r6=220(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 439
LDI r1, 2
LDI r2, 299
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 220
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
