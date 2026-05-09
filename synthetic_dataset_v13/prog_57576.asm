; DESCRIPTION: Renders a blue line between points (253, 47) and (412, 153).
; PLAN: r0=253(x1), r1=47(y1), r2=412(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 47
LDI r2, 412
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
