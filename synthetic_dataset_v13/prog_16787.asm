; DESCRIPTION: Draws a blue line from (266, 64) to (259, 148).
; PLAN: r0=266(x1), r1=64(y1), r2=259(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 64
LDI r2, 259
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
