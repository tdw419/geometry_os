; DESCRIPTION: Draws a white line from (322, 192) to (432, 194).
; PLAN: r0=322(x1), r1=192(y1), r2=432(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 192
LDI r2, 432
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
