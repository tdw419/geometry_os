; DESCRIPTION: Draws a purple line from (418, 146) to (196, 26).
; PLAN: r0=418(x1), r1=146(y1), r2=196(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 146
LDI r2, 196
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
