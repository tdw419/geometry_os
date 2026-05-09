; DESCRIPTION: Renders a purple line between points (464, 137) and (84, 219).
; PLAN: r0=464(x1), r1=137(y1), r2=84(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 137
LDI r2, 84
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
