; DESCRIPTION: Renders a purple line between points (466, 81) and (215, 7).
; PLAN: r0=466(x1), r1=81(y1), r2=215(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 81
LDI r2, 215
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
