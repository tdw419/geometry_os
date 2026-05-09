; DESCRIPTION: Places a green line segment connecting (322, 20) to (241, 142).
; PLAN: r0=322(x1), r1=20(y1), r2=241(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 20
LDI r2, 241
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
