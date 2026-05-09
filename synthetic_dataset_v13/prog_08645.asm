; DESCRIPTION: Renders a purple line between points (263, 128) and (158, 176).
; PLAN: r0=263(x1), r1=128(y1), r2=158(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 128
LDI r2, 158
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
