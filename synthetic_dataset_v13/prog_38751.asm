; DESCRIPTION: Renders a blue line between points (399, 1) and (79, 51).
; PLAN: r0=399(x1), r1=1(y1), r2=79(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 1
LDI r2, 79
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
