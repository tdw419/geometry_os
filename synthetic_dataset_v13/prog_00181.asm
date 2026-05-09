; DESCRIPTION: Draws a purple line from (195, 51) to (418, 210).
; PLAN: r0=195(x1), r1=51(y1), r2=418(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 51
LDI r2, 418
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
