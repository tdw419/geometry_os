; DESCRIPTION: Draws a blue line from (78, 90) to (433, 181).
; PLAN: r0=78(x1), r1=90(y1), r2=433(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 90
LDI r2, 433
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
