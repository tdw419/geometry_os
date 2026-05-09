; DESCRIPTION: Composite: Places a purple line segment connecting (97, 66) to (491, 15) then Sets a single cyan pixel at (153, 16).
; PLAN: r0=97(x1), r1=66(y1), r2=491(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=16(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 66
LDI r2, 491
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 16
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
