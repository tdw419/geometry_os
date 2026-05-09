; DESCRIPTION: Draws a purple line from (208, 253) to (363, 23).
; PLAN: r0=208(x1), r1=253(y1), r2=363(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 253
LDI r2, 363
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
