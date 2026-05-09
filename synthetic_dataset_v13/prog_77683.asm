; DESCRIPTION: Renders a purple line between points (10, 140) and (482, 82).
; PLAN: r0=10(x1), r1=140(y1), r2=482(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 140
LDI r2, 482
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
