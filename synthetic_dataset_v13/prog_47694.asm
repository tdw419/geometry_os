; DESCRIPTION: Renders a blue line between points (51, 51) and (465, 88).
; PLAN: r0=51(x1), r1=51(y1), r2=465(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 51
LDI r2, 465
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
