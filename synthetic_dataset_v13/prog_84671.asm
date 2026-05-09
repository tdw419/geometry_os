; DESCRIPTION: Composite: Draws a cyan line from (50, 63) to (251, 31) then Sets a single black pixel at (271, 58).
; PLAN: r0=50(x1), r1=63(y1), r2=251(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=58(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 50
LDI r1, 63
LDI r2, 251
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 58
LDI r7, 0x000000
PSET r5, r6, r7
HALT
