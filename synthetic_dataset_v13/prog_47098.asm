; DESCRIPTION: Renders a blue line between points (0, 136) and (392, 98).
; PLAN: r0=0(x1), r1=136(y1), r2=392(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 136
LDI r2, 392
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
