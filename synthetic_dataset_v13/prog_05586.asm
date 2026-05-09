; DESCRIPTION: Draws a blue line from (405, 89) to (206, 35).
; PLAN: r0=405(x1), r1=89(y1), r2=206(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 89
LDI r2, 206
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
