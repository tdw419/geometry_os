; DESCRIPTION: Renders a blue line between points (55, 48) and (87, 32).
; PLAN: r0=55(x1), r1=48(y1), r2=87(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 48
LDI r2, 87
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
