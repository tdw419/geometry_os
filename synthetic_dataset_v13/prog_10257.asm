; DESCRIPTION: Composite: Renders a magenta line between points (131, 154) and (467, 241) then Places a purple dot at position (84, 82).
; PLAN: r0=131(x1), r1=154(y1), r2=467(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=82(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 131
LDI r1, 154
LDI r2, 467
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 82
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
