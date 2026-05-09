; DESCRIPTION: Draws a purple line from (241, 193) to (455, 26).
; PLAN: r0=241(x1), r1=193(y1), r2=455(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 193
LDI r2, 455
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
