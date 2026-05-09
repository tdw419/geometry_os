; DESCRIPTION: Renders a blue line between points (472, 105) and (267, 196).
; PLAN: r0=472(x1), r1=105(y1), r2=267(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 105
LDI r2, 267
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
