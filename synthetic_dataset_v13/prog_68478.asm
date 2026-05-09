; DESCRIPTION: Composite: Draws a white line from (335, 192) to (386, 216) then Sets a single yellow pixel at (9, 214).
; PLAN: r0=335(x1), r1=192(y1), r2=386(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=214(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 192
LDI r2, 386
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 214
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
