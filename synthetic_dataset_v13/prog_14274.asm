; DESCRIPTION: Renders a blue line between points (123, 11) and (279, 191).
; PLAN: r0=123(x1), r1=11(y1), r2=279(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 11
LDI r2, 279
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
