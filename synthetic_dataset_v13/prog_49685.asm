; DESCRIPTION: Draws a blue line from (468, 3) to (329, 181).
; PLAN: r0=468(x1), r1=3(y1), r2=329(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 3
LDI r2, 329
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
