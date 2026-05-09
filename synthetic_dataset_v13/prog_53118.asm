; DESCRIPTION: Renders a blue line between points (468, 48) and (457, 214).
; PLAN: r0=468(x1), r1=48(y1), r2=457(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 48
LDI r2, 457
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
