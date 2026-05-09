; DESCRIPTION: Composite: Renders a purple line between points (163, 235) and (405, 59) then Places a red dot at position (143, 182).
; PLAN: r0=163(x1), r1=235(y1), r2=405(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=182(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 163
LDI r1, 235
LDI r2, 405
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 182
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
