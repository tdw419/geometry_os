; DESCRIPTION: Renders a yellow line between points (413, 218) and (322, 92).
; PLAN: r0=413(x1), r1=218(y1), r2=322(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 218
LDI r2, 322
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
