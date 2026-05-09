; DESCRIPTION: Draws a purple line from (211, 132) to (292, 220).
; PLAN: r0=211(x1), r1=132(y1), r2=292(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 132
LDI r2, 292
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
