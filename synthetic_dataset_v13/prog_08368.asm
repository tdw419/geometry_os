; DESCRIPTION: Renders a blue line between points (259, 78) and (495, 233).
; PLAN: r0=259(x1), r1=78(y1), r2=495(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 78
LDI r2, 495
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
