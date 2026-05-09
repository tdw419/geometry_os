; DESCRIPTION: Renders a blue line between points (367, 121) and (495, 115).
; PLAN: r0=367(x1), r1=121(y1), r2=495(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 121
LDI r2, 495
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
