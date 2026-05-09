; DESCRIPTION: Renders a blue line between points (73, 36) and (412, 211).
; PLAN: r0=73(x1), r1=36(y1), r2=412(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 36
LDI r2, 412
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
