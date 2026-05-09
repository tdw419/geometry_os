; DESCRIPTION: Composite: Draws a blue line from (327, 74) to (342, 49) then Sets a single yellow pixel at (302, 195).
; PLAN: r0=327(x1), r1=74(y1), r2=342(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=195(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 74
LDI r2, 342
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 195
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
