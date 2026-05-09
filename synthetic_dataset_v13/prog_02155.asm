; DESCRIPTION: Renders a blue line between points (144, 82) and (484, 241).
; PLAN: r0=144(x1), r1=82(y1), r2=484(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 82
LDI r2, 484
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
