; DESCRIPTION: Renders a purple line between points (16, 253) and (101, 118).
; PLAN: r0=16(x1), r1=253(y1), r2=101(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 253
LDI r2, 101
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
