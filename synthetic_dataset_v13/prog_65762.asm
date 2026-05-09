; DESCRIPTION: Composite: Places a cyan line segment connecting (411, 79) to (429, 48) then Sets a single black pixel at (122, 23).
; PLAN: r0=411(x1), r1=79(y1), r2=429(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=23(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 411
LDI r1, 79
LDI r2, 429
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 23
LDI r7, 0x000000
PSET r5, r6, r7
HALT
