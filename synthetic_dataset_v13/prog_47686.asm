; DESCRIPTION: Renders a blue line between points (273, 1) and (481, 183).
; PLAN: r0=273(x1), r1=1(y1), r2=481(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 1
LDI r2, 481
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
