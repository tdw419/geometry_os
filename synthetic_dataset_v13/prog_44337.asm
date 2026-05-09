; DESCRIPTION: Draws a purple line from (331, 134) to (113, 80).
; PLAN: r0=331(x1), r1=134(y1), r2=113(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 134
LDI r2, 113
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
