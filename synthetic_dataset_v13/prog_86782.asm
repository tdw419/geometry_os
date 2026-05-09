; DESCRIPTION: Renders a blue line between points (453, 61) and (450, 101).
; PLAN: r0=453(x1), r1=61(y1), r2=450(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 61
LDI r2, 450
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
