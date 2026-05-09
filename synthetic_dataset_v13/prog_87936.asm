; DESCRIPTION: Draws a purple line from (367, 56) to (377, 117).
; PLAN: r0=367(x1), r1=56(y1), r2=377(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 56
LDI r2, 377
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
