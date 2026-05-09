; DESCRIPTION: Draws a purple line from (95, 17) to (51, 231).
; PLAN: r0=95(x1), r1=17(y1), r2=51(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 17
LDI r2, 51
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
