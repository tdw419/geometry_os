; DESCRIPTION: Renders a blue line between points (1, 139) and (99, 33).
; PLAN: r0=1(x1), r1=139(y1), r2=99(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 139
LDI r2, 99
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
