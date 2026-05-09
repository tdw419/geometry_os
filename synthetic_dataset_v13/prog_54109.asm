; DESCRIPTION: Draws a yellow line from (431, 194) to (360, 216).
; PLAN: r0=431(x1), r1=194(y1), r2=360(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 194
LDI r2, 360
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
