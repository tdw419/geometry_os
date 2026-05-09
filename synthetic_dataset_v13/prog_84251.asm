; DESCRIPTION: Draws a blue line from (331, 161) to (49, 14).
; PLAN: r0=331(x1), r1=161(y1), r2=49(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 161
LDI r2, 49
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
