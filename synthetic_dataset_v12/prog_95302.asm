; DESCRIPTION: Composite: Draws a purple line from (110, 66) to (411, 151) then Sets a single cyan pixel at (450, 129).
; PLAN: r0=110(x1), r1=66(y1), r2=411(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=129(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 110
LDI r1, 66
LDI r2, 411
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 129
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
