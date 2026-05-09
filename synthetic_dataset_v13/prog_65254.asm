; DESCRIPTION: Draws a blue line from (292, 19) to (33, 94).
; PLAN: r0=292(x1), r1=19(y1), r2=33(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 19
LDI r2, 33
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
