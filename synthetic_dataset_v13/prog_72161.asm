; DESCRIPTION: Composite: Draws a yellow line from (5, 87) to (200, 161) then Sets a single green pixel at (414, 172).
; PLAN: r0=5(x1), r1=87(y1), r2=200(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=172(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 5
LDI r1, 87
LDI r2, 200
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 172
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
