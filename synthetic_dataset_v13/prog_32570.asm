; DESCRIPTION: Renders a blue line between points (138, 132) and (506, 152).
; PLAN: r0=138(x1), r1=132(y1), r2=506(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 132
LDI r2, 506
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
