; DESCRIPTION: Renders a blue line between points (142, 38) and (468, 210).
; PLAN: r0=142(x1), r1=38(y1), r2=468(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 38
LDI r2, 468
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
