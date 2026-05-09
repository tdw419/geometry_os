; DESCRIPTION: Composite: Sets a single magenta pixel at (100, 198) then Draws a black line from (12, 87) to (483, 10).
; PLAN: r0=100(x), r1=198(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=12(x1), r6=87(y1), r7=483(x2), r8=10(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 198
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 12
LDI r6, 87
LDI r7, 483
LDI r8, 10
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
