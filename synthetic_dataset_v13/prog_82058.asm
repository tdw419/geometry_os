; DESCRIPTION: Composite: Renders a yellow line between points (462, 45) and (83, 118) then Places a black dot at position (359, 64).
; PLAN: r0=462(x1), r1=45(y1), r2=83(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=64(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 462
LDI r1, 45
LDI r2, 83
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 64
LDI r7, 0x000000
PSET r5, r6, r7
HALT
