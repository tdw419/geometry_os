; DESCRIPTION: Draws a blue line from (319, 57) to (301, 35).
; PLAN: r0=319(x1), r1=57(y1), r2=301(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 57
LDI r2, 301
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
