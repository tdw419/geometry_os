; DESCRIPTION: Draws a blue line from (345, 34) to (413, 58).
; PLAN: r0=345(x1), r1=34(y1), r2=413(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 34
LDI r2, 413
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
