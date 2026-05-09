; DESCRIPTION: Draws a blue line from (471, 91) to (329, 140).
; PLAN: r0=471(x1), r1=91(y1), r2=329(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 91
LDI r2, 329
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
