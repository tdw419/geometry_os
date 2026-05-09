; DESCRIPTION: Draws a purple line from (351, 229) to (48, 102).
; PLAN: r0=351(x1), r1=229(y1), r2=48(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 229
LDI r2, 48
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
