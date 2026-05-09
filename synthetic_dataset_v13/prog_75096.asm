; DESCRIPTION: Composite: Renders a cyan line between points (323, 185) and (124, 148) then Places a orange dot at position (449, 202).
; PLAN: r0=323(x1), r1=185(y1), r2=124(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=202(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 323
LDI r1, 185
LDI r2, 124
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 202
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
