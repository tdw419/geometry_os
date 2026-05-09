; DESCRIPTION: Renders a blue line between points (125, 89) and (345, 164).
; PLAN: r0=125(x1), r1=89(y1), r2=345(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 89
LDI r2, 345
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
