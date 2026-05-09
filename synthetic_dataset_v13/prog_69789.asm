; DESCRIPTION: Draws a blue line from (214, 142) to (134, 53).
; PLAN: r0=214(x1), r1=142(y1), r2=134(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 142
LDI r2, 134
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
