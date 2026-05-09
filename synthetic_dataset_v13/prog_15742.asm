; DESCRIPTION: Composite: Renders a yellow line between points (28, 235) and (157, 44) then Sets a single purple pixel at (422, 218).
; PLAN: r0=28(x1), r1=235(y1), r2=157(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=218(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 28
LDI r1, 235
LDI r2, 157
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 218
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
