; DESCRIPTION: Composite: Renders a magenta line between points (496, 127) and (187, 113) then Places a purple dot at position (322, 169).
; PLAN: r0=496(x1), r1=127(y1), r2=187(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=169(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 496
LDI r1, 127
LDI r2, 187
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 169
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
