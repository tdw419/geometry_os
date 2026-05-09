; DESCRIPTION: Draws a blue line from (474, 97) to (79, 51).
; PLAN: r0=474(x1), r1=97(y1), r2=79(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 97
LDI r2, 79
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
