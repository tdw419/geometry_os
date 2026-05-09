; DESCRIPTION: Draws a purple line from (146, 12) to (105, 51).
; PLAN: r0=146(x1), r1=12(y1), r2=105(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 12
LDI r2, 105
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
