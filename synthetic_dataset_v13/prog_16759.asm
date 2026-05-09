; DESCRIPTION: Composite: Renders a purple line between points (214, 73) and (260, 116) then Sets a single black pixel at (322, 236).
; PLAN: r0=214(x1), r1=73(y1), r2=260(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=236(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 214
LDI r1, 73
LDI r2, 260
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 236
LDI r7, 0x000000
PSET r5, r6, r7
HALT
