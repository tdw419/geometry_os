; DESCRIPTION: Composite: Renders a cyan line between points (185, 73) and (25, 185) then Sets a single purple pixel at (195, 203).
; PLAN: r0=185(x1), r1=73(y1), r2=25(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=203(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 73
LDI r2, 25
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 203
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
