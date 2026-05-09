; DESCRIPTION: Renders a purple line between points (148, 142) and (102, 132).
; PLAN: r0=148(x1), r1=142(y1), r2=102(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 142
LDI r2, 102
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
