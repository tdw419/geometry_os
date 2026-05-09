; DESCRIPTION: Composite: Draws a cyan line from (397, 255) to (96, 89) then Sets a single yellow pixel at (201, 55).
; PLAN: r0=397(x1), r1=255(y1), r2=96(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=55(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 397
LDI r1, 255
LDI r2, 96
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 55
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
