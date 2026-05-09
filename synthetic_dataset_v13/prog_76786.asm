; DESCRIPTION: Composite: Draws a green line from (149, 98) to (83, 244) then Sets a single magenta pixel at (205, 185).
; PLAN: r0=149(x1), r1=98(y1), r2=83(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=185(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 149
LDI r1, 98
LDI r2, 83
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 185
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
