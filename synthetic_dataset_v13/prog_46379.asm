; DESCRIPTION: Draws a purple line from (421, 2) to (367, 157).
; PLAN: r0=421(x1), r1=2(y1), r2=367(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 2
LDI r2, 367
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
