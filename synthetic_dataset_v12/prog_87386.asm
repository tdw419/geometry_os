; DESCRIPTION: Renders a purple line between points (100, 241) and (236, 150).
; PLAN: r0=100(x1), r1=241(y1), r2=236(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 241
LDI r2, 236
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
