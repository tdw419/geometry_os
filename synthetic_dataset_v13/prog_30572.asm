; DESCRIPTION: Draws a purple line from (26, 79) to (221, 208).
; PLAN: r0=26(x1), r1=79(y1), r2=221(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 79
LDI r2, 221
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
