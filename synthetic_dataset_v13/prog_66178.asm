; DESCRIPTION: Draws a purple line from (51, 143) to (502, 78).
; PLAN: r0=51(x1), r1=143(y1), r2=502(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 143
LDI r2, 502
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
