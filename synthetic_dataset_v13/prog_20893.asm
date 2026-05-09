; DESCRIPTION: Draws a blue line from (484, 51) to (48, 84).
; PLAN: r0=484(x1), r1=51(y1), r2=48(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 51
LDI r2, 48
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
