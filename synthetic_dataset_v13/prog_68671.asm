; DESCRIPTION: Draws a blue line from (338, 238) to (225, 88).
; PLAN: r0=338(x1), r1=238(y1), r2=225(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 238
LDI r2, 225
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
