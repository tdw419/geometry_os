; DESCRIPTION: Draws a green line from (322, 222) to (100, 35).
; PLAN: r0=322(x1), r1=222(y1), r2=100(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 222
LDI r2, 100
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
