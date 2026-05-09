; DESCRIPTION: Renders a blue line between points (124, 61) and (87, 55).
; PLAN: r0=124(x1), r1=61(y1), r2=87(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 61
LDI r2, 87
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
