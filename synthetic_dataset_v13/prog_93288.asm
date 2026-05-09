; DESCRIPTION: Composite: Draws a magenta line from (184, 250) to (238, 6) then Sets a single cyan pixel at (204, 110).
; PLAN: r0=184(x1), r1=250(y1), r2=238(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=110(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 184
LDI r1, 250
LDI r2, 238
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 110
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
