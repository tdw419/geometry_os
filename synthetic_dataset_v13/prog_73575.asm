; DESCRIPTION: Renders a purple line between points (446, 3) and (481, 25).
; PLAN: r0=446(x1), r1=3(y1), r2=481(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 3
LDI r2, 481
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
