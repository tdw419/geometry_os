; DESCRIPTION: Renders a blue line between points (192, 108) and (506, 61).
; PLAN: r0=192(x1), r1=108(y1), r2=506(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 108
LDI r2, 506
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
