; DESCRIPTION: Composite: Places a green line segment connecting (415, 217) to (180, 248) then Sets a single yellow pixel at (417, 160).
; PLAN: r0=415(x1), r1=217(y1), r2=180(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=160(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 217
LDI r2, 180
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 160
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
