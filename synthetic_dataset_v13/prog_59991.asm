; DESCRIPTION: Renders a purple line between points (80, 168) and (213, 67).
; PLAN: r0=80(x1), r1=168(y1), r2=213(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 168
LDI r2, 213
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
