; DESCRIPTION: Renders a blue line between points (51, 113) and (293, 39).
; PLAN: r0=51(x1), r1=113(y1), r2=293(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 113
LDI r2, 293
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
