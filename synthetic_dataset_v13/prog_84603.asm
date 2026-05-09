; DESCRIPTION: Places a white line segment connecting (457, 65) to (322, 12).
; PLAN: r0=457(x1), r1=65(y1), r2=322(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 65
LDI r2, 322
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
