; DESCRIPTION: Composite: Sets a single black pixel at (462, 32) then Draws a black line from (295, 106) to (2, 51).
; PLAN: r0=462(x), r1=32(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=295(x1), r6=106(y1), r7=2(x2), r8=51(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 32
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 295
LDI r6, 106
LDI r7, 2
LDI r8, 51
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
