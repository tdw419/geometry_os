; DESCRIPTION: Draws a blue line from (134, 210) to (293, 119).
; PLAN: r0=134(x1), r1=210(y1), r2=293(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 210
LDI r2, 293
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
