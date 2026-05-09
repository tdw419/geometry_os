; DESCRIPTION: Renders a blue line between points (321, 219) and (127, 184).
; PLAN: r0=321(x1), r1=219(y1), r2=127(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 219
LDI r2, 127
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
