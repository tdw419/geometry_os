; DESCRIPTION: Composite: Places a purple dot at position (475, 152) then Renders a blue line between points (447, 179) and (282, 216).
; PLAN: r0=475(x), r1=152(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=447(x1), r6=179(y1), r7=282(x2), r8=216(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 152
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 447
LDI r6, 179
LDI r7, 282
LDI r8, 216
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
