; DESCRIPTION: Renders a blue line between points (134, 132) and (1, 142).
; PLAN: r0=134(x1), r1=132(y1), r2=1(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 132
LDI r2, 1
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
