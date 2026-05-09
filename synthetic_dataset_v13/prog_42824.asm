; DESCRIPTION: Draws a purple line from (172, 249) to (417, 168).
; PLAN: r0=172(x1), r1=249(y1), r2=417(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 249
LDI r2, 417
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
