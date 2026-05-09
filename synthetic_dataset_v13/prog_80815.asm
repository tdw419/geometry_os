; DESCRIPTION: Draws a black line from (220, 133) to (51, 135).
; PLAN: r0=220(x1), r1=133(y1), r2=51(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 133
LDI r2, 51
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
