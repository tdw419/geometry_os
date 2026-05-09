; DESCRIPTION: Draws a blue line from (349, 73) to (170, 84).
; PLAN: r0=349(x1), r1=73(y1), r2=170(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 73
LDI r2, 170
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
