; DESCRIPTION: Draws a blue line from (145, 59) to (397, 38).
; PLAN: r0=145(x1), r1=59(y1), r2=397(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 59
LDI r2, 397
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
