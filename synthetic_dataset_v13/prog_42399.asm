; DESCRIPTION: Renders a purple line between points (370, 67) and (217, 80).
; PLAN: r0=370(x1), r1=67(y1), r2=217(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 67
LDI r2, 217
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
