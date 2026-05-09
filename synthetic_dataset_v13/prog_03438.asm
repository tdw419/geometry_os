; DESCRIPTION: Renders a purple line between points (156, 179) and (87, 56).
; PLAN: r0=156(x1), r1=179(y1), r2=87(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 179
LDI r2, 87
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
