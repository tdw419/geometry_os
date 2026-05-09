; DESCRIPTION: Renders a green line between points (288, 38) and (322, 218).
; PLAN: r0=288(x1), r1=38(y1), r2=322(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 38
LDI r2, 322
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
