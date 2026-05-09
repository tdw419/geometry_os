; DESCRIPTION: Draws a purple line from (434, 126) to (457, 119).
; PLAN: r0=434(x1), r1=126(y1), r2=457(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 126
LDI r2, 457
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
