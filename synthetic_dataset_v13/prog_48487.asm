; DESCRIPTION: Renders a blue line between points (101, 177) and (211, 178).
; PLAN: r0=101(x1), r1=177(y1), r2=211(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 177
LDI r2, 211
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
