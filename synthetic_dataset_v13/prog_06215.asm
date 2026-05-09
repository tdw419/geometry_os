; DESCRIPTION: Composite: Renders a purple line between points (25, 217) and (499, 12) then Sets a single green pixel at (431, 237).
; PLAN: r0=25(x1), r1=217(y1), r2=499(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=237(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 25
LDI r1, 217
LDI r2, 499
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 237
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
