; DESCRIPTION: Composite: Places a cyan line segment connecting (345, 88) to (34, 145) then Sets a single purple pixel at (354, 5).
; PLAN: r0=345(x1), r1=88(y1), r2=34(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=5(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 345
LDI r1, 88
LDI r2, 34
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 5
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
