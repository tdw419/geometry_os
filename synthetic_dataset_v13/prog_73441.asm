; DESCRIPTION: Composite: Places a purple line segment connecting (447, 113) to (329, 120) then Sets a single green pixel at (226, 138).
; PLAN: r0=447(x1), r1=113(y1), r2=329(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=138(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 447
LDI r1, 113
LDI r2, 329
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 138
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
