; DESCRIPTION: Renders a purple line between points (170, 95) and (460, 117).
; PLAN: r0=170(x1), r1=95(y1), r2=460(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 95
LDI r2, 460
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
