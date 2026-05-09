; DESCRIPTION: Draws a purple line from (79, 51) to (398, 72).
; PLAN: r0=79(x1), r1=51(y1), r2=398(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 51
LDI r2, 398
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
