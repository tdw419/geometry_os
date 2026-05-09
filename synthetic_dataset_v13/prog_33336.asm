; DESCRIPTION: Renders a purple line between points (127, 10) and (438, 67).
; PLAN: r0=127(x1), r1=10(y1), r2=438(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 10
LDI r2, 438
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
