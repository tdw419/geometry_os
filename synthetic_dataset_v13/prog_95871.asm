; DESCRIPTION: Composite: Places a black line segment connecting (166, 45) to (447, 95) then Sets a single magenta pixel at (32, 233).
; PLAN: r0=166(x1), r1=45(y1), r2=447(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=233(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 45
LDI r2, 447
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 233
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
