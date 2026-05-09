; DESCRIPTION: Draws a black line from (388, 104) to (322, 66).
; PLAN: r0=388(x1), r1=104(y1), r2=322(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 104
LDI r2, 322
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
