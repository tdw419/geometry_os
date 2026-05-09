; DESCRIPTION: Renders a purple line between points (481, 11) and (460, 45).
; PLAN: r0=481(x1), r1=11(y1), r2=460(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 11
LDI r2, 460
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
