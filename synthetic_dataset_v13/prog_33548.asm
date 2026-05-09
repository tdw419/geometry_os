; DESCRIPTION: Draws a purple line from (229, 189) to (115, 131).
; PLAN: r0=229(x1), r1=189(y1), r2=115(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 189
LDI r2, 115
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
