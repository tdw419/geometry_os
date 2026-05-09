; DESCRIPTION: Places a purple line segment connecting (262, 168) to (423, 165).
; PLAN: r0=262(x1), r1=168(y1), r2=423(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 168
LDI r2, 423
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
