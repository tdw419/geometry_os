; DESCRIPTION: Renders a red line between points (328, 185) and (322, 61).
; PLAN: r0=328(x1), r1=185(y1), r2=322(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 185
LDI r2, 322
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
