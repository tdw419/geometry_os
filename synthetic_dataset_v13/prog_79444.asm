; DESCRIPTION: Renders a blue line between points (356, 149) and (121, 149).
; PLAN: r0=356(x1), r1=149(y1), r2=121(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 149
LDI r2, 121
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
