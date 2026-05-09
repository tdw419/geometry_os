; DESCRIPTION: Renders a blue line between points (421, 74) and (465, 216).
; PLAN: r0=421(x1), r1=74(y1), r2=465(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 74
LDI r2, 465
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
