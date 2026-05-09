; DESCRIPTION: Renders a purple line between points (481, 161) and (95, 255).
; PLAN: r0=481(x1), r1=161(y1), r2=95(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 161
LDI r2, 95
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
