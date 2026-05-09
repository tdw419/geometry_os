; DESCRIPTION: Draws a blue line from (10, 140) to (39, 59).
; PLAN: r0=10(x1), r1=140(y1), r2=39(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 140
LDI r2, 39
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
