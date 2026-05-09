; DESCRIPTION: Composite: Draws a cyan line from (33, 136) to (490, 45) then Sets a single yellow pixel at (262, 127).
; PLAN: r0=33(x1), r1=136(y1), r2=490(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=127(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 33
LDI r1, 136
LDI r2, 490
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 127
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
