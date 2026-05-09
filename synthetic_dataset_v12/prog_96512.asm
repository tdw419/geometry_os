; DESCRIPTION: Renders a blue line between points (484, 26) and (228, 84).
; PLAN: r0=484(x1), r1=26(y1), r2=228(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 26
LDI r2, 228
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
