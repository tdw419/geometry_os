; DESCRIPTION: Draws a purple line from (132, 148) to (496, 161).
; PLAN: r0=132(x1), r1=148(y1), r2=496(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 148
LDI r2, 496
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
