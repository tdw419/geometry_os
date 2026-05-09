; DESCRIPTION: Renders a blue line between points (15, 100) and (124, 95).
; PLAN: r0=15(x1), r1=100(y1), r2=124(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 100
LDI r2, 124
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
