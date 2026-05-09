; DESCRIPTION: Composite: Places a orange line segment connecting (208, 7) to (202, 250) then Sets a single purple pixel at (300, 99).
; PLAN: r0=208(x1), r1=7(y1), r2=202(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=99(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 208
LDI r1, 7
LDI r2, 202
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 99
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
