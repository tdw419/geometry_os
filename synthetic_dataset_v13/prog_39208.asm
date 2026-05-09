; DESCRIPTION: Composite: Places a green line segment connecting (506, 79) to (365, 191) then Sets a single magenta pixel at (467, 61).
; PLAN: r0=506(x1), r1=79(y1), r2=365(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=61(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 506
LDI r1, 79
LDI r2, 365
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 61
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
