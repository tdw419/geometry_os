; DESCRIPTION: Renders a purple line between points (113, 82) and (1, 34).
; PLAN: r0=113(x1), r1=82(y1), r2=1(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 82
LDI r2, 1
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
