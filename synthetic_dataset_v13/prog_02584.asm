; DESCRIPTION: Draws a purple line from (24, 214) to (413, 197).
; PLAN: r0=24(x1), r1=214(y1), r2=413(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 214
LDI r2, 413
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
