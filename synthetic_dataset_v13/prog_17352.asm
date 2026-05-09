; DESCRIPTION: Renders a purple line between points (177, 55) and (481, 140).
; PLAN: r0=177(x1), r1=55(y1), r2=481(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 55
LDI r2, 481
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
