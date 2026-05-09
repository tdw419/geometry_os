; DESCRIPTION: Renders a blue line between points (11, 127) and (99, 240).
; PLAN: r0=11(x1), r1=127(y1), r2=99(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 127
LDI r2, 99
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
