; DESCRIPTION: Composite: Draws a green line from (470, 139) to (193, 104) then Sets a single yellow pixel at (223, 178).
; PLAN: r0=470(x1), r1=139(y1), r2=193(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=178(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 470
LDI r1, 139
LDI r2, 193
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 178
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
