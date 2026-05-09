; DESCRIPTION: Renders a blue line between points (356, 227) and (11, 19).
; PLAN: r0=356(x1), r1=227(y1), r2=11(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 227
LDI r2, 11
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
