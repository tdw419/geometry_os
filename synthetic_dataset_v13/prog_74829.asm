; DESCRIPTION: Draws a blue line from (2, 138) to (191, 184).
; PLAN: r0=2(x1), r1=138(y1), r2=191(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 138
LDI r2, 191
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
