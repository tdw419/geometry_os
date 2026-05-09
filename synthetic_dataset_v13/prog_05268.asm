; DESCRIPTION: Renders a purple line between points (462, 90) and (358, 171).
; PLAN: r0=462(x1), r1=90(y1), r2=358(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 90
LDI r2, 358
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
