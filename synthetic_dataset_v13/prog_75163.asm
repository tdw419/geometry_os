; DESCRIPTION: Renders a purple line between points (376, 220) and (77, 82).
; PLAN: r0=376(x1), r1=220(y1), r2=77(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 220
LDI r2, 77
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
