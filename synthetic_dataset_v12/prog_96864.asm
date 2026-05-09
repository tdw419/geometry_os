; DESCRIPTION: Draws a blue line from (426, 73) to (387, 100).
; PLAN: r0=426(x1), r1=73(y1), r2=387(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 73
LDI r2, 387
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
