; DESCRIPTION: Renders a blue line between points (148, 194) and (46, 181).
; PLAN: r0=148(x1), r1=194(y1), r2=46(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 194
LDI r2, 46
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
