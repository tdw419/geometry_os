; DESCRIPTION: Composite: Places a yellow line segment connecting (447, 2) to (387, 152) then Sets a single green pixel at (18, 180).
; PLAN: r0=447(x1), r1=2(y1), r2=387(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=180(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 447
LDI r1, 2
LDI r2, 387
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 180
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
