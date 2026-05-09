; DESCRIPTION: Draws a blue line from (87, 234) to (370, 158).
; PLAN: r0=87(x1), r1=234(y1), r2=370(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 234
LDI r2, 370
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
