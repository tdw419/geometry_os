; DESCRIPTION: Renders a blue line between points (221, 90) and (18, 58).
; PLAN: r0=221(x1), r1=90(y1), r2=18(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 90
LDI r2, 18
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
