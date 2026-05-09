; DESCRIPTION: Draws a blue line from (259, 124) to (55, 108).
; PLAN: r0=259(x1), r1=124(y1), r2=55(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 124
LDI r2, 55
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
