; DESCRIPTION: Draws a purple line from (254, 11) to (78, 195).
; PLAN: r0=254(x1), r1=11(y1), r2=78(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 11
LDI r2, 78
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
