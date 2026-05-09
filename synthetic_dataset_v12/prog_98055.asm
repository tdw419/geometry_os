; DESCRIPTION: Renders a blue line between points (321, 210) and (87, 79).
; PLAN: r0=321(x1), r1=210(y1), r2=87(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 210
LDI r2, 87
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
