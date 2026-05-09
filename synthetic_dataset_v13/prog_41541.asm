; DESCRIPTION: Draws a purple line from (206, 236) to (483, 220).
; PLAN: r0=206(x1), r1=236(y1), r2=483(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 236
LDI r2, 483
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
