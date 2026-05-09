; DESCRIPTION: Draws a blue line from (254, 94) to (226, 26).
; PLAN: r0=254(x1), r1=94(y1), r2=226(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 94
LDI r2, 226
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
