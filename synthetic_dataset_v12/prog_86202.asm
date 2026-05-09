; DESCRIPTION: Draws a purple line from (0, 171) to (151, 67).
; PLAN: r0=0(x1), r1=171(y1), r2=151(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 171
LDI r2, 151
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
