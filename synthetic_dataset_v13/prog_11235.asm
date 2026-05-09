; DESCRIPTION: Renders a blue line between points (423, 23) and (226, 127).
; PLAN: r0=423(x1), r1=23(y1), r2=226(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 23
LDI r2, 226
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
