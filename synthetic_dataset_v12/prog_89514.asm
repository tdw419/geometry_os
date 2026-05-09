; DESCRIPTION: Draws a purple line from (389, 45) to (283, 209).
; PLAN: r0=389(x1), r1=45(y1), r2=283(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 45
LDI r2, 283
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
