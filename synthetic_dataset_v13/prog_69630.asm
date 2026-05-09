; DESCRIPTION: Renders a blue line between points (362, 51) and (475, 29).
; PLAN: r0=362(x1), r1=51(y1), r2=475(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 51
LDI r2, 475
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
