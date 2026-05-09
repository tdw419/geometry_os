; DESCRIPTION: Draws a blue line from (291, 43) to (149, 152).
; PLAN: r0=291(x1), r1=43(y1), r2=149(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 43
LDI r2, 149
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
