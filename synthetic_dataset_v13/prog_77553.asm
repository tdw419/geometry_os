; DESCRIPTION: Draws a blue line from (59, 122) to (292, 19).
; PLAN: r0=59(x1), r1=122(y1), r2=292(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 122
LDI r2, 292
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
