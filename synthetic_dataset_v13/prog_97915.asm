; DESCRIPTION: Composite: Renders a white line between points (106, 105) and (23, 204) then Places a white dot at position (490, 126).
; PLAN: r0=106(x1), r1=105(y1), r2=23(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=490(x), r6=126(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 105
LDI r2, 23
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 126
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
