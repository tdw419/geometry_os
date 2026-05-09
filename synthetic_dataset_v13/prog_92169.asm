; DESCRIPTION: Composite: Renders a orange line between points (230, 191) and (425, 30) then Sets a single cyan pixel at (61, 30).
; PLAN: r0=230(x1), r1=191(y1), r2=425(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=30(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 230
LDI r1, 191
LDI r2, 425
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 30
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
