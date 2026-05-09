; DESCRIPTION: Places a yellow line segment connecting (16, 251) to (322, 212).
; PLAN: r0=16(x1), r1=251(y1), r2=322(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 251
LDI r2, 322
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
