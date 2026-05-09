; DESCRIPTION: Draws a blue line from (76, 103) to (102, 216).
; PLAN: r0=76(x1), r1=103(y1), r2=102(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 103
LDI r2, 102
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
