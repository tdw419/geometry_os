; DESCRIPTION: Renders a blue line between points (5, 74) and (454, 100).
; PLAN: r0=5(x1), r1=74(y1), r2=454(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 74
LDI r2, 454
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
