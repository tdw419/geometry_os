; DESCRIPTION: Composite: Renders a white disk with center (477, 172) and radius 19 then Renders a purple line between points (99, 19) and (131, 4) then Sets a single orange pixel at (202, 194).
; PLAN: r0=477(x), r1=172(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x1), r6=19(y1), r7=131(x2), r8=4(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=194(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 477
LDI r1, 172
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 19
LDI r7, 131
LDI r8, 4
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 194
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
