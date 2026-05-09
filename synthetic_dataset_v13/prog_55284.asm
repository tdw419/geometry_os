; DESCRIPTION: Renders a blue line between points (269, 103) and (22, 127).
; PLAN: r0=269(x1), r1=103(y1), r2=22(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 103
LDI r2, 22
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
