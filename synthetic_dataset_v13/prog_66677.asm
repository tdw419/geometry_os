; DESCRIPTION: Renders a blue line between points (350, 105) and (140, 125).
; PLAN: r0=350(x1), r1=105(y1), r2=140(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 105
LDI r2, 140
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
