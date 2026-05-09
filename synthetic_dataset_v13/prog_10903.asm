; DESCRIPTION: Renders a blue line between points (364, 36) and (312, 82).
; PLAN: r0=364(x1), r1=36(y1), r2=312(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 36
LDI r2, 312
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
