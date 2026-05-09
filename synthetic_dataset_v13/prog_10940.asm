; DESCRIPTION: Renders a purple line between points (291, 236) and (181, 176).
; PLAN: r0=291(x1), r1=236(y1), r2=181(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 236
LDI r2, 181
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
