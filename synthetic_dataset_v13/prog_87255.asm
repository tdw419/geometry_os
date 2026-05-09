; DESCRIPTION: Places a yellow line segment connecting (322, 57) to (116, 139).
; PLAN: r0=322(x1), r1=57(y1), r2=116(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 57
LDI r2, 116
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
