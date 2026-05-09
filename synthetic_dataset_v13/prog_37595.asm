; DESCRIPTION: Renders a blue line between points (495, 120) and (441, 183).
; PLAN: r0=495(x1), r1=120(y1), r2=441(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 120
LDI r2, 441
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
