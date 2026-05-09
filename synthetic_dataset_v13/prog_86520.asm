; DESCRIPTION: Draws a black line from (77, 58) to (322, 7).
; PLAN: r0=77(x1), r1=58(y1), r2=322(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 58
LDI r2, 322
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
