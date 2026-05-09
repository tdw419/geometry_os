; DESCRIPTION: Composite: Places a orange line segment connecting (343, 132) to (80, 71) then Sets a single cyan pixel at (145, 25).
; PLAN: r0=343(x1), r1=132(y1), r2=80(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=25(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 343
LDI r1, 132
LDI r2, 80
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 25
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
