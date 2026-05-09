; DESCRIPTION: Draws a blue line from (437, 193) to (363, 70).
; PLAN: r0=437(x1), r1=193(y1), r2=363(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 193
LDI r2, 363
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
