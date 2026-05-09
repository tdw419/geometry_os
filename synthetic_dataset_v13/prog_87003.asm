; DESCRIPTION: Places a blue line segment connecting (437, 226) to (385, 26).
; PLAN: r0=437(x1), r1=226(y1), r2=385(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 226
LDI r2, 385
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
