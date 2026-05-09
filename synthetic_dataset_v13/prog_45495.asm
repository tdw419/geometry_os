; DESCRIPTION: Draws a purple line from (317, 97) to (219, 173).
; PLAN: r0=317(x1), r1=97(y1), r2=219(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 97
LDI r2, 219
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
