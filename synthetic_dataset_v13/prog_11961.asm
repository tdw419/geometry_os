; DESCRIPTION: Composite: Draws a green line from (28, 40) to (195, 0) then Sets a single purple pixel at (423, 79).
; PLAN: r0=28(x1), r1=40(y1), r2=195(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=79(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 28
LDI r1, 40
LDI r2, 195
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 79
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
