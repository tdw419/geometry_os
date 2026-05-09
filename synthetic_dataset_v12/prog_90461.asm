; DESCRIPTION: Composite: Places a white dot at position (388, 101) then Renders a black line between points (452, 66) and (82, 105).
; PLAN: r0=388(x), r1=101(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=452(x1), r6=66(y1), r7=82(x2), r8=105(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 101
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 452
LDI r6, 66
LDI r7, 82
LDI r8, 105
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
