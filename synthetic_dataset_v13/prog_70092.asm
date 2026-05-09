; DESCRIPTION: Renders a blue line between points (30, 66) and (293, 48).
; PLAN: r0=30(x1), r1=66(y1), r2=293(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 66
LDI r2, 293
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
