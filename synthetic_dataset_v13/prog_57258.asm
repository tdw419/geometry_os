; DESCRIPTION: Renders a purple line between points (508, 97) and (434, 20).
; PLAN: r0=508(x1), r1=97(y1), r2=434(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 97
LDI r2, 434
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
