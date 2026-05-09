; DESCRIPTION: Renders a blue line between points (423, 236) and (167, 100).
; PLAN: r0=423(x1), r1=236(y1), r2=167(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 236
LDI r2, 167
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
