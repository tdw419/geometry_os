; DESCRIPTION: Draws a blue line from (51, 0) to (3, 6).
; PLAN: r0=51(x1), r1=0(y1), r2=3(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 0
LDI r2, 3
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
