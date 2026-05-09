; DESCRIPTION: Draws a blue line from (18, 140) to (53, 73).
; PLAN: r0=18(x1), r1=140(y1), r2=53(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 140
LDI r2, 53
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
