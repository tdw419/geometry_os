; DESCRIPTION: Draws a green line from (322, 172) to (102, 87).
; PLAN: r0=322(x1), r1=172(y1), r2=102(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 172
LDI r2, 102
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
