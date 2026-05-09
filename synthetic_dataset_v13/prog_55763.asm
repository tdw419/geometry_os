; DESCRIPTION: Composite: Places a black line segment connecting (483, 212) to (366, 190) then Places a cyan dot at position (412, 13).
; PLAN: r0=483(x1), r1=212(y1), r2=366(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=13(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 483
LDI r1, 212
LDI r2, 366
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 13
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
