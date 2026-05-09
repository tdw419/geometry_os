; DESCRIPTION: Draws a blue line from (430, 12) to (80, 249).
; PLAN: r0=430(x1), r1=12(y1), r2=80(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 12
LDI r2, 80
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
