; DESCRIPTION: Composite: Places a orange line segment connecting (221, 115) to (127, 98) then Sets a single green pixel at (229, 206).
; PLAN: r0=221(x1), r1=115(y1), r2=127(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=206(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 221
LDI r1, 115
LDI r2, 127
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 206
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
