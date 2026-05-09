; DESCRIPTION: Composite: Renders a red line between points (364, 105) and (383, 181) then Sets a single purple pixel at (188, 196).
; PLAN: r0=364(x1), r1=105(y1), r2=383(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=196(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 105
LDI r2, 383
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 196
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
